import '../models/chucker_http_record.dart';
import '../models/chucker_log_query.dart';

List<ChuckerHttpRecord> applyChuckerQuery(
  Iterable<ChuckerHttpRecord> records,
  ChuckerLogQuery query,
) {
  final search = query.search.trim().toLowerCase();

  final filtered = records.where((record) {
    if (search.isNotEmpty && !record.searchableText.contains(search)) {
      return false;
    }

    if (!_matchesMethod(record, query.method)) {
      return false;
    }

    if (!_matchesStatus(record, query.status)) {
      return false;
    }

    if (!_matchesPerformance(record, query.performance)) {
      return false;
    }

    if (query.errorsOnly && !record.hasError) {
      return false;
    }

    return true;
  }).toList();

  filtered.sort((left, right) {
    return switch (query.sortOrder) {
      ChuckerSortOrder.newest => right.startedAt.compareTo(left.startedAt),
      ChuckerSortOrder.oldest => left.startedAt.compareTo(right.startedAt),
      ChuckerSortOrder.durationDesc => right.durationMs.compareTo(
        left.durationMs,
      ),
      ChuckerSortOrder.durationAsc => left.durationMs.compareTo(
        right.durationMs,
      ),
    };
  });

  return filtered;
}

bool _matchesMethod(ChuckerHttpRecord record, ChuckerHttpMethodFilter method) {
  return switch (method) {
    ChuckerHttpMethodFilter.all => true,
    ChuckerHttpMethodFilter.get => record.method.toUpperCase() == 'GET',
    ChuckerHttpMethodFilter.post => record.method.toUpperCase() == 'POST',
    ChuckerHttpMethodFilter.put => record.method.toUpperCase() == 'PUT',
    ChuckerHttpMethodFilter.patch => record.method.toUpperCase() == 'PATCH',
    ChuckerHttpMethodFilter.delete => record.method.toUpperCase() == 'DELETE',
  };
}

bool _matchesStatus(ChuckerHttpRecord record, ChuckerStatusFilter status) {
  return switch (status) {
    ChuckerStatusFilter.all => true,
    ChuckerStatusFilter.success => record.isSuccess,
    ChuckerStatusFilter.clientError => record.isClientError,
    ChuckerStatusFilter.serverError => record.isServerError,
    ChuckerStatusFilter.cancelled => record.isCancelled,
  };
}

bool _matchesPerformance(
  ChuckerHttpRecord record,
  ChuckerPerformanceFilter performance,
) {
  return switch (performance) {
    ChuckerPerformanceFilter.all => true,
    ChuckerPerformanceFilter.fast => !record.isSlow,
    ChuckerPerformanceFilter.slow => record.isSlow,
  };
}
