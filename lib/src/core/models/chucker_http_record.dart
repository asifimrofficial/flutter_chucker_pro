import 'dart:convert';

import 'package:isar_community/isar.dart';

part 'chucker_http_record.g.dart';

@collection
class ChuckerHttpRecord {
  ChuckerHttpRecord({
    this.id = Isar.autoIncrement,
    required this.sessionId,
    required this.source,
    required this.method,
    required this.url,
    required this.host,
    required this.path,
    required this.searchableText,
    required this.startedAt,
    required this.endedAt,
    required this.durationMs,
    required this.statusCode,
    required this.hasError,
    required this.isCancelled,
    required this.isSlow,
    required this.requestSize,
    required this.responseSize,
    required this.requestHeadersJson,
    required this.responseHeadersJson,
    required this.queryParametersJson,
    this.requestBody,
    this.responseBody,
    this.contentType,
    this.error,
    this.errorType,
  });

  Id id;

  @Index(type: IndexType.hash)
  late String sessionId;

  @Index(type: IndexType.hash)
  late String source;

  @Index(type: IndexType.hash, caseSensitive: false)
  late String method;

  @Index(type: IndexType.hash, caseSensitive: false)
  late String host;

  @Index(type: IndexType.value, caseSensitive: false)
  late String path;

  @Index(type: IndexType.value, caseSensitive: false)
  late String searchableText;

  late String url;

  @Index()
  late DateTime startedAt;

  @Index()
  late DateTime endedAt;

  @Index()
  late int durationMs;

  @Index()
  int? statusCode;

  @Index()
  late bool hasError;

  @Index()
  late bool isCancelled;

  @Index()
  late bool isSlow;

  late int requestSize;
  late int responseSize;
  late String requestHeadersJson;
  late String responseHeadersJson;
  late String queryParametersJson;
  String? requestBody;
  String? responseBody;
  String? contentType;
  String? error;
  String? errorType;

  @ignore
  Map<String, Object?> get requestHeaders =>
      _decodeMap(requestHeadersJson).cast<String, Object?>();

  @ignore
  Map<String, Object?> get responseHeaders =>
      _decodeMap(responseHeadersJson).cast<String, Object?>();

  @ignore
  Map<String, Object?> get queryParameters =>
      _decodeMap(queryParametersJson).cast<String, Object?>();

  @ignore
  String get statusLabel {
    if (isCancelled) {
      return 'Cancelled';
    }
    return statusCode?.toString() ?? (hasError ? 'ERR' : '-');
  }

  @ignore
  String get routeLabel {
    final parsed = Uri.tryParse(url);
    final displayPath = parsed?.path.isNotEmpty == true ? parsed!.path : path;
    final query = parsed?.query;
    if (query == null || query.isEmpty) {
      return displayPath.isEmpty ? url : displayPath;
    }
    return '$displayPath?$query';
  }

  @ignore
  bool get isSuccess =>
      statusCode != null && statusCode! >= 200 && statusCode! < 300;

  @ignore
  bool get isClientError =>
      statusCode != null && statusCode! >= 400 && statusCode! < 500;

  @ignore
  bool get isServerError => statusCode != null && statusCode! >= 500;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'sessionId': sessionId,
      'source': source,
      'method': method,
      'url': url,
      'host': host,
      'path': path,
      'startedAt': startedAt.toIso8601String(),
      'endedAt': endedAt.toIso8601String(),
      'durationMs': durationMs,
      'statusCode': statusCode,
      'hasError': hasError,
      'isCancelled': isCancelled,
      'isSlow': isSlow,
      'requestSize': requestSize,
      'responseSize': responseSize,
      'requestHeaders': requestHeaders,
      'responseHeaders': responseHeaders,
      'queryParameters': queryParameters,
      if (requestBody != null) 'requestBody': requestBody,
      if (responseBody != null) 'responseBody': responseBody,
      if (contentType != null) 'contentType': contentType,
      if (error != null) 'error': error,
      if (errorType != null) 'errorType': errorType,
      'timeline': <String, Object?>{
        'requestStarted': startedAt.toIso8601String(),
        'responseReceived': endedAt.toIso8601String(),
        'durationMs': durationMs,
      },
    };
  }

  static String encodeMap(Map<String, Object?> value) => jsonEncode(value);

  static String buildSearchableText({
    required String method,
    required String url,
    required String host,
    required String path,
    int? statusCode,
    String? error,
  }) {
    final parts = <String>[method, url, host, path];
    if (statusCode != null) {
      parts.add(statusCode.toString());
    }
    if (error != null) {
      parts.add(error);
    }
    return parts.join(' ').toLowerCase();
  }

  static Map<String, dynamic> _decodeMap(String json) {
    if (json.isEmpty) {
      return <String, dynamic>{};
    }

    final decoded = jsonDecode(json);
    if (decoded is Map<String, dynamic>) {
      return decoded;
    }
    if (decoded is Map) {
      return decoded.map((key, value) => MapEntry(key.toString(), value));
    }
    return <String, dynamic>{};
  }
}
