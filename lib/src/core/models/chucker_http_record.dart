import 'dart:convert';

class ChuckerHttpRecord {
  ChuckerHttpRecord({
    this.id = autoIncrementId,
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

  static const int autoIncrementId = -1;

  int id;

  late String sessionId;

  late String source;

  late String method;

  late String host;

  late String path;

  late String searchableText;

  late String url;

  late DateTime startedAt;

  late DateTime endedAt;

  late int durationMs;

  int? statusCode;

  late bool hasError;

  late bool isCancelled;

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

  Map<String, Object?> get requestHeaders =>
      _decodeMap(requestHeadersJson).cast<String, Object?>();

  Map<String, Object?> get responseHeaders =>
      _decodeMap(responseHeadersJson).cast<String, Object?>();

  Map<String, Object?> get queryParameters =>
      _decodeMap(queryParametersJson).cast<String, Object?>();

  String get statusLabel {
    if (isCancelled) {
      return 'Cancelled';
    }
    return statusCode?.toString() ?? (hasError ? 'ERR' : '-');
  }

  String get routeLabel {
    final parsed = Uri.tryParse(url);
    final displayPath = parsed?.path.isNotEmpty == true ? parsed!.path : path;
    final query = parsed?.query;
    if (query == null || query.isEmpty) {
      return displayPath.isEmpty ? url : displayPath;
    }
    return '$displayPath?$query';
  }

  bool get isSuccess =>
      statusCode != null && statusCode! >= 200 && statusCode! < 300;

  bool get isClientError =>
      statusCode != null && statusCode! >= 400 && statusCode! < 500;

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

  Map<String, Object?> toStorageJson() {
    return <String, Object?>{
      'id': id,
      'sessionId': sessionId,
      'source': source,
      'method': method,
      'url': url,
      'host': host,
      'path': path,
      'searchableText': searchableText,
      'startedAt': startedAt.toIso8601String(),
      'endedAt': endedAt.toIso8601String(),
      'durationMs': durationMs,
      'statusCode': statusCode,
      'hasError': hasError,
      'isCancelled': isCancelled,
      'isSlow': isSlow,
      'requestSize': requestSize,
      'responseSize': responseSize,
      'requestHeadersJson': requestHeadersJson,
      'responseHeadersJson': responseHeadersJson,
      'queryParametersJson': queryParametersJson,
      'requestBody': requestBody,
      'responseBody': responseBody,
      'contentType': contentType,
      'error': error,
      'errorType': errorType,
    };
  }

  factory ChuckerHttpRecord.fromStorageJson(Map<String, Object?> json) {
    return ChuckerHttpRecord(
      id: _asInt(json['id']) ?? autoIncrementId,
      sessionId: _asString(json['sessionId']),
      source: _asString(json['source']),
      method: _asString(json['method']),
      url: _asString(json['url']),
      host: _asString(json['host']),
      path: _asString(json['path']),
      searchableText: _asString(json['searchableText']),
      startedAt: _asDateTime(json['startedAt']),
      endedAt: _asDateTime(json['endedAt']),
      durationMs: _asInt(json['durationMs']) ?? 0,
      statusCode: _asInt(json['statusCode']),
      hasError: _asBool(json['hasError']),
      isCancelled: _asBool(json['isCancelled']),
      isSlow: _asBool(json['isSlow']),
      requestSize: _asInt(json['requestSize']) ?? 0,
      responseSize: _asInt(json['responseSize']) ?? 0,
      requestHeadersJson: _asString(json['requestHeadersJson']),
      responseHeadersJson: _asString(json['responseHeadersJson']),
      queryParametersJson: _asString(json['queryParametersJson']),
      requestBody: json['requestBody'] as String?,
      responseBody: json['responseBody'] as String?,
      contentType: json['contentType'] as String?,
      error: json['error'] as String?,
      errorType: json['errorType'] as String?,
    );
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

  static String _asString(Object? value) => value?.toString() ?? '';

  static int? _asInt(Object? value) {
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    return int.tryParse(value?.toString() ?? '');
  }

  static bool _asBool(Object? value) {
    if (value is bool) {
      return value;
    }
    return value?.toString() == 'true';
  }

  static DateTime _asDateTime(Object? value) {
    if (value is DateTime) {
      return value;
    }
    return DateTime.tryParse(value?.toString() ?? '') ?? DateTime.now().toUtc();
  }
}
