import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

import '../models/chucker_http_record.dart';
import '../models/chucker_log_query.dart';
import '../models/chucker_stats.dart';
import 'chucker_log_repository.dart';
import 'chucker_record_filtering.dart';

class SembastChuckerLogRepository implements ChuckerLogRepository {
  SembastChuckerLogRepository._(this._database);

  static final StoreRef<int, Map<String, Object?>> _store = intMapStoreFactory
      .store('requests');

  final Database _database;
  final StreamController<void> _changes = StreamController<void>.broadcast();

  static Future<SembastChuckerLogRepository> open({
    String name = 'flutter_chucker_pro',
    String? directory,
  }) async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final storageDirectory = directory ?? p.join(documentsDirectory.path, name);
    await Directory(storageDirectory).create(recursive: true);

    final database = await databaseFactoryIo.openDatabase(
      p.join(storageDirectory, '$name.sembast'),
    );
    return SembastChuckerLogRepository._(database);
  }

  @override
  Future<void> save(ChuckerHttpRecord record) async {
    if (record.id == ChuckerHttpRecord.autoIncrementId) {
      final key = await _store.add(_database, record.toStorageJson());
      record.id = key;
      await _store.record(key).update(_database, record.toStorageJson());
    } else {
      await _store.record(record.id).put(_database, record.toStorageJson());
    }
    _changes.add(null);
  }

  @override
  Future<List<ChuckerHttpRecord>> getRequests({
    ChuckerLogQuery query = const ChuckerLogQuery(),
    int offset = 0,
    int limit = 40,
  }) async {
    final records = await _allRecords();
    return applyChuckerQuery(records, query).skip(offset).take(limit).toList();
  }

  @override
  Future<int> count({ChuckerLogQuery query = const ChuckerLogQuery()}) async {
    final records = await _allRecords();
    return applyChuckerQuery(records, query).length;
  }

  @override
  Future<ChuckerHttpRecord?> getById(int id) async {
    final value = await _store.record(id).get(_database);
    if (value == null) {
      return null;
    }
    return ChuckerHttpRecord.fromStorageJson(value);
  }

  @override
  Stream<ChuckerStats> watchStats() async* {
    yield await getStats();
    yield* _changes.stream.asyncMap((_) => getStats());
  }

  @override
  Stream<List<ChuckerHttpRecord>> watchRequests({
    ChuckerLogQuery query = const ChuckerLogQuery(),
    int limit = 40,
  }) async* {
    yield await getRequests(query: query, limit: limit);
    yield* _changes.stream.asyncMap(
      (_) => getRequests(query: query, limit: limit),
    );
  }

  @override
  Future<ChuckerStats> getStats() async {
    final records = await _allRecords();
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

    final records = await _allRecords();
    if (records.length <= maxStoredRequests) {
      return;
    }

    records.sort((left, right) => right.startedAt.compareTo(left.startedAt));
    final staleIds = records
        .skip(maxStoredRequests)
        .map((record) => record.id)
        .toList();
    await _store.records(staleIds).delete(_database);
    _changes.add(null);
  }

  @override
  Future<void> clear() async {
    await _store.delete(_database);
    _changes.add(null);
  }

  @override
  Future<void> close() async {
    await _changes.close();
    await _database.close();
  }

  Future<List<ChuckerHttpRecord>> _allRecords() async {
    final snapshots = await _store.find(_database);
    return snapshots.map((snapshot) {
      final record = ChuckerHttpRecord.fromStorageJson(snapshot.value);
      record.id = snapshot.key;
      return record;
    }).toList();
  }
}
