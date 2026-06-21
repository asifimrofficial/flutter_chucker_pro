import '../models/chucker_http_record.dart';
import '../models/chucker_log_query.dart';
import '../models/chucker_stats.dart';

abstract interface class ChuckerLogRepository {
  Future<void> save(ChuckerHttpRecord record);

  Future<List<ChuckerHttpRecord>> getRequests({
    ChuckerLogQuery query = const ChuckerLogQuery(),
    int offset = 0,
    int limit = 40,
  });

  Future<int> count({ChuckerLogQuery query = const ChuckerLogQuery()});

  Future<ChuckerHttpRecord?> getById(int id);

  Stream<ChuckerStats> watchStats();

  Stream<List<ChuckerHttpRecord>> watchRequests({
    ChuckerLogQuery query = const ChuckerLogQuery(),
    int limit = 40,
  });

  Future<ChuckerStats> getStats();

  Future<List<ChuckerHttpRecord>> exportAll({int limit = 10000});

  Future<void> enforceLimit(int maxStoredRequests);

  Future<void> clear();

  Future<void> close();
}
