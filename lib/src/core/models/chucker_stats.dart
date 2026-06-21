import 'package:flutter/foundation.dart';

@immutable
class ChuckerStats {
  const ChuckerStats({
    required this.totalRequests,
    required this.errorRequests,
    required this.slowRequests,
    required this.cancelledRequests,
  });

  const ChuckerStats.empty()
    : totalRequests = 0,
      errorRequests = 0,
      slowRequests = 0,
      cancelledRequests = 0;

  final int totalRequests;
  final int errorRequests;
  final int slowRequests;
  final int cancelledRequests;

  bool get hasErrors => errorRequests > 0;
}
