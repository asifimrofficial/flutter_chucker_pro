import 'package:flutter/foundation.dart';

enum ChuckerHttpMethodFilter { all, get, post, put, patch, delete }

enum ChuckerStatusFilter { all, success, clientError, serverError, cancelled }

enum ChuckerPerformanceFilter { all, fast, slow }

enum ChuckerSortOrder { newest, oldest, durationDesc, durationAsc }

@immutable
class ChuckerLogQuery {
  const ChuckerLogQuery({
    this.search = '',
    this.method = ChuckerHttpMethodFilter.all,
    this.status = ChuckerStatusFilter.all,
    this.performance = ChuckerPerformanceFilter.all,
    this.errorsOnly = false,
    this.sortOrder = ChuckerSortOrder.newest,
  });

  final String search;
  final ChuckerHttpMethodFilter method;
  final ChuckerStatusFilter status;
  final ChuckerPerformanceFilter performance;
  final bool errorsOnly;
  final ChuckerSortOrder sortOrder;

  bool get hasFilters =>
      search.trim().isNotEmpty ||
      method != ChuckerHttpMethodFilter.all ||
      status != ChuckerStatusFilter.all ||
      performance != ChuckerPerformanceFilter.all ||
      errorsOnly;

  ChuckerLogQuery copyWith({
    String? search,
    ChuckerHttpMethodFilter? method,
    ChuckerStatusFilter? status,
    ChuckerPerformanceFilter? performance,
    bool? errorsOnly,
    ChuckerSortOrder? sortOrder,
  }) {
    return ChuckerLogQuery(
      search: search ?? this.search,
      method: method ?? this.method,
      status: status ?? this.status,
      performance: performance ?? this.performance,
      errorsOnly: errorsOnly ?? this.errorsOnly,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
