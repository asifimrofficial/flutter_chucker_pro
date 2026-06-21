import 'dart:async';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../core/config/flutter_chucker_config.dart';
import '../core/models/chucker_http_record.dart';
import '../core/services/chucker_capture_service.dart';
import '../core/services/flutter_chucker.dart';
import 'chucker_dio_payload_serializer.dart';

class ChuckerInterceptor extends Interceptor {
  ChuckerInterceptor({
    ChuckerCaptureService? captureService,
    ChuckerDioPayloadSerializer serializer =
        const ChuckerDioPayloadSerializer(),
  }) : _captureService = captureService,
       _serializer = serializer;

  static const String _startedAtExtraKey = 'flutter_chucker_started_at';

  final ChuckerCaptureService? _captureService;
  final ChuckerDioPayloadSerializer _serializer;

  ChuckerCaptureService? get _service =>
      _captureService ?? FlutterChucker.captureService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra[_startedAtExtraKey] = DateTime.now().toUtc();
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final service = _service;
    if (service != null && service.isCapturing) {
      final record = DioRecordBuilder(
        serializer: _serializer,
      ).fromResponse(response, config: service.config);
      unawaited(service.capture(record));
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final service = _service;
    if (service != null && service.isCapturing) {
      final record = DioRecordBuilder(
        serializer: _serializer,
      ).fromError(err, config: service.config);
      unawaited(service.capture(record));
    }
    handler.next(err);
  }
}

@visibleForTesting
class DioRecordBuilder {
  DioRecordBuilder({
    ChuckerDioPayloadSerializer serializer =
        const ChuckerDioPayloadSerializer(),
  }) : _serializer = serializer;

  static const String _startedAtExtraKey =
      ChuckerInterceptor._startedAtExtraKey;

  final ChuckerDioPayloadSerializer _serializer;

  ChuckerHttpRecord fromResponse(
    Response<dynamic> response, {
    required FlutterChuckerConfig config,
  }) {
    final options = response.requestOptions;
    final startedAt = _startedAt(options);
    final endedAt = DateTime.now().toUtc();
    final requestBody = _serializer.serializeRequestBody(options.data, config);
    final responseBody = _serializer.serializeResponseBody(
      response.data,
      config,
    );
    final statusCode = response.statusCode;

    return _record(
      options: options,
      config: config,
      startedAt: startedAt,
      endedAt: endedAt,
      requestBody: requestBody,
      responseBody: responseBody,
      statusCode: statusCode,
      responseHeaders: response.headers,
      contentType:
          response.headers.value(Headers.contentTypeHeader) ??
          response.requestOptions.contentType,
    );
  }

  ChuckerHttpRecord fromError(
    DioException error, {
    required FlutterChuckerConfig config,
  }) {
    final options = error.requestOptions;
    final startedAt = _startedAt(options);
    final endedAt = DateTime.now().toUtc();
    final requestBody = _serializer.serializeRequestBody(options.data, config);
    final responseBody = _serializer.serializeResponseBody(
      error.response?.data,
      config,
    );
    final statusCode = error.response?.statusCode;
    final isCancelled = error.type == DioExceptionType.cancel;
    final errorMessage = _errorMessage(error);

    return _record(
      options: options,
      config: config,
      startedAt: startedAt,
      endedAt: endedAt,
      requestBody: requestBody,
      responseBody: responseBody,
      statusCode: statusCode,
      responseHeaders: error.response?.headers,
      contentType:
          error.response?.headers.value(Headers.contentTypeHeader) ??
          options.contentType,
      hasError: true,
      isCancelled: isCancelled,
      error: errorMessage,
      errorType: error.type.name,
    );
  }

  ChuckerHttpRecord _record({
    required RequestOptions options,
    required FlutterChuckerConfig config,
    required DateTime startedAt,
    required DateTime endedAt,
    required String? requestBody,
    required String? responseBody,
    required int? statusCode,
    Headers? responseHeaders,
    String? contentType,
    bool hasError = false,
    bool isCancelled = false,
    String? error,
    String? errorType,
  }) {
    final uri = options.uri;
    final duration = endedAt.difference(startedAt);
    final method = options.method.toUpperCase();
    final requestHeaders = _serializer.headersFromRequest(
      options.headers,
      config,
    );
    final resolvedResponseHeaders = responseHeaders == null
        ? <String, Object?>{}
        : _serializer.headersFromResponse(responseHeaders, config);
    final queryParameters = _serializer.queryParameters(
      options.queryParameters,
    );
    final resolvedHasError =
        hasError || isCancelled || (statusCode != null && statusCode >= 400);

    return ChuckerHttpRecord(
      sessionId:
          config.sessionId ??
          'session-${DateTime.now().toUtc().microsecondsSinceEpoch}',
      source: 'dio',
      method: method,
      url: uri.toString(),
      host: uri.host,
      path: uri.path,
      searchableText: ChuckerHttpRecord.buildSearchableText(
        method: method,
        url: uri.toString(),
        host: uri.host,
        path: uri.path,
        statusCode: statusCode,
        error: error,
      ),
      startedAt: startedAt,
      endedAt: endedAt,
      durationMs: duration.inMilliseconds,
      statusCode: statusCode,
      hasError: resolvedHasError,
      isCancelled: isCancelled,
      isSlow: duration >= config.slowRequestThreshold,
      requestSize: _serializer.byteSize(requestBody),
      responseSize: _serializer.byteSize(responseBody),
      requestHeadersJson: ChuckerHttpRecord.encodeMap(requestHeaders),
      responseHeadersJson: ChuckerHttpRecord.encodeMap(resolvedResponseHeaders),
      queryParametersJson: ChuckerHttpRecord.encodeMap(queryParameters),
      requestBody: requestBody,
      responseBody: responseBody,
      contentType: contentType,
      error: error,
      errorType: errorType,
    );
  }

  DateTime _startedAt(RequestOptions options) {
    final value = options.extra[_startedAtExtraKey];
    if (value is DateTime) {
      return value.toUtc();
    }
    return DateTime.now().toUtc();
  }

  String _errorMessage(DioException error) {
    final message = error.message;
    final innerError = error.error;
    if (message != null && message.isNotEmpty) {
      return message;
    }
    if (innerError != null) {
      return innerError.toString();
    }
    return error.type.name;
  }
}
