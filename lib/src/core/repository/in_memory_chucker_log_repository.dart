import 'dart:async';

import '../models/chucker_http_record.dart';
import '../models/chucker_log_query.dart';
import '../models/chucker_stats.dart';
import 'chucker_log_repository.dart';
import 'chucker_record_filtering.dart';

class InMemoryChuckerLogRepository implements ChuckerLogRepository {
  final List<ChuckerHttpRecord> _records = <ChuckerHttpRecord>[];
  final StreamController<void> _changes = StreamController<void>.broadcast();
  int _nextId = 1;

  @override
  Future<void> save(ChuckerHttpRecord record) async {
    if (record.id == ChuckerHttpRecord.autoIncrementId) {
      record.id = _nextId++;
    }
    _records.removeWhere((item) => item.id == record.id);
    _records.add(record);
    _changes.add(null);
  }

  @override
  Future<List<ChuckerHttpRecord>> getRequests({
    ChuckerLogQuery query = const ChuckerLogQuery(),
    int offset = 0,
    int limit = 40,
  }) async {
    return applyChuckerQuery(_records, query).skip(offset).take(limit).toList();
  }

  @override
  Future<int> count({ChuckerLogQuery query = const ChuckerLogQuery()}) async {
    return applyChuckerQuery(_records, query).length;
  }

  @override
  Future<ChuckerHttpRecord?> getById(int id) async {
    for (final record in _records) {
      if (record.id == id) {
        return record;
      }
    }
    return null;
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
    return ChuckerStats(
      totalRequests: _records.length,
      errorRequests: _records.where((record) => record.hasError).length,
      slowRequests: _records.where((record) => record.isSlow).length,
      cancelledRequests: _records.where((record) => record.isCancelled).length,
    );
  }

  @override
  Future<List<ChuckerHttpRecord>> exportAll({int limit = 10000}) async {
    return applyChuckerQuery(
      _records,
      const ChuckerLogQuery(),
    ).take(limit).toList();
  }

  @override
  Future<void> enforceLimit(int maxStoredRequests) async {
    if (maxStoredRequests <= 0 || _records.length <= maxStoredRequests) {
      return;
    }

    final sorted = List<ChuckerHttpRecord>.from(_records)
      ..sort((left, right) => right.startedAt.compareTo(left.startedAt));
    final keepIds = sorted
        .take(maxStoredRequests)
        .map((record) => record.id)
        .toSet();
    _records.removeWhere((record) => !keepIds.contains(record.id));
    _changes.add(null);
  }

  @override
  Future<void> clear() async {
    _records.clear();
    _changes.add(null);
  }

  @override
  Future<void> close() async {
    await _changes.close();
  }
}
