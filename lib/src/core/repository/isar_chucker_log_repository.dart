import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../models/chucker_http_record.dart';
import '../models/chucker_log_query.dart';
import '../models/chucker_stats.dart';
import 'chucker_log_repository.dart';
import 'chucker_record_filtering.dart';

class IsarChuckerLogRepository implements ChuckerLogRepository {
  IsarChuckerLogRepository._(this._isar);

  final Isar _isar;

  static Future<IsarChuckerLogRepository> open({
    String name = 'flutter_chucker_pro',
    String? directory,
  }) async {
    final storageDirectory =
        directory ??
        p.join((await getApplicationDocumentsDirectory()).path, name);
    final isar = await Isar.open(
      <CollectionSchema<dynamic>>[ChuckerHttpRecordSchema],
      directory: storageDirectory,
      name: name,
      inspector: false,
    );
    return IsarChuckerLogRepository._(isar);
  }

  IsarCollection<ChuckerHttpRecord> get _collection =>
      _isar.collection<ChuckerHttpRecord>();

  @override
  Future<void> save(ChuckerHttpRecord record) async {
    await _isar.writeTxn(() => _collection.put(record));
  }

  @override
  Future<List<ChuckerHttpRecord>> getRequests({
    ChuckerLogQuery query = const ChuckerLogQuery(),
    int offset = 0,
    int limit = 40,
  }) async {
    final records = await _collection.where().findAll();
    return applyChuckerQuery(records, query).skip(offset).take(limit).toList();
  }

  @override
  Future<int> count({ChuckerLogQuery query = const ChuckerLogQuery()}) async {
    final records = await _collection.where().findAll();
    return applyChuckerQuery(records, query).length;
  }

  @override
  Future<ChuckerHttpRecord?> getById(int id) => _collection.get(id);

  @override
  Stream<ChuckerStats> watchStats() async* {
    yield await getStats();
    yield* _collection
        .watchLazy(fireImmediately: false)
        .asyncMap((_) => getStats());
  }

  @override
  Stream<List<ChuckerHttpRecord>> watchRequests({
    ChuckerLogQuery query = const ChuckerLogQuery(),
    int limit = 40,
  }) async* {
    yield await getRequests(query: query, limit: limit);
    yield* _collection
        .watchLazy(fireImmediately: false)
        .asyncMap((_) => getRequests(query: query, limit: limit));
  }

  @override
  Future<ChuckerStats> getStats() async {
    final records = await _collection.where().findAll();
    return ChuckerStats(
      totalRequests: records.length,
      errorRequests: records.where((record) => record.hasError).length,
      slowRequests: records.where((record) => record.isSlow).length,
      cancelledRequests: records.where((record) => record.isCancelled).length,
    );
  }

  @override
  Future<List<ChuckerHttpRecord>> exportAll({int limit = 10000}) async {
    return getRequests(limit: limit);
  }

  @override
  Future<void> enforceLimit(int maxStoredRequests) async {
    if (maxStoredRequests <= 0) {
      return;
    }

    final records = await _collection.where().findAll();
    if (records.length <= maxStoredRequests) {
      return;
    }

    records.sort((left, right) => right.startedAt.compareTo(left.startedAt));
    final staleIds = records
        .skip(maxStoredRequests)
        .map((record) => record.id)
        .toList();
    await _isar.writeTxn(() => _collection.deleteAll(staleIds));
  }

  @override
  Future<void> clear() async {
    await _isar.writeTxn(_collection.clear);
  }

  @override
  Future<void> close() async {
    await _isar.close();
  }
}
