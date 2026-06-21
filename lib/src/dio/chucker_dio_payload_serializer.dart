import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../core/config/flutter_chucker_config.dart';

class ChuckerDioPayloadSerializer {
  const ChuckerDioPayloadSerializer();

  Map<String, Object?> headersFromRequest(
    Map<String, dynamic> headers,
    FlutterChuckerConfig config,
  ) {
    return _maskHeaders(headers, config.normalizedMaskedHeaders);
  }

  Map<String, Object?> headersFromResponse(
    Headers headers,
    FlutterChuckerConfig config,
  ) {
    return _maskHeaders(headers.map, config.normalizedMaskedHeaders);
  }

  Map<String, Object?> queryParameters(Map<String, dynamic> queryParameters) {
    return queryParameters.map(
      (key, value) => MapEntry(key, _jsonSafeValue(value)),
    );
  }

  String? serializeRequestBody(Object? body, FlutterChuckerConfig config) {
    if (!config.captureRequestBody) {
      return null;
    }
    return _serialize(body, config);
  }

  String? serializeResponseBody(Object? body, FlutterChuckerConfig config) {
    if (!config.captureResponseBody) {
      return null;
    }
    return _serialize(body, config);
  }

  int byteSize(String? value) {
    if (value == null) {
      return 0;
    }
    return utf8.encode(value).length;
  }

  Map<String, Object?> _maskHeaders(
    Map<String, Object?> headers,
    Set<String> maskedHeaders,
  ) {
    return headers.map((key, value) {
      final shouldMask = maskedHeaders.contains(key.toLowerCase());
      return MapEntry(key, shouldMask ? '*****' : _jsonSafeValue(value));
    });
  }

  String? _serialize(Object? body, FlutterChuckerConfig config) {
    if (body == null) {
      return null;
    }

    final normalized = _jsonSafeValue(
      body,
      captureBinaryBodies: config.captureBinaryBodies,
    );
    final raw = normalized is String ? normalized : jsonEncode(normalized);
    if (raw.length <= config.maxBodyBytes) {
      return raw;
    }
    return '${raw.substring(0, config.maxBodyBytes)}\n<truncated>';
  }

  Object? _jsonSafeValue(Object? value, {bool captureBinaryBodies = false}) {
    if (value == null || value is String || value is num || value is bool) {
      return value;
    }

    if (value is DateTime) {
      return value.toIso8601String();
    }

    if (value is Uri) {
      return value.toString();
    }

    if (value is FormData) {
      return <String, Object?>{
        '_chuckerType': 'formData',
        'fields': value.fields
            .map(
              (field) => <String, Object?>{
                'name': field.key,
                'value': field.value,
              },
            )
            .toList(),
        'files': value.files
            .map(
              (file) => <String, Object?>{
                'name': file.key,
                'filename': file.value.filename,
                'contentType': file.value.contentType?.toString(),
                'length': file.value.length,
              },
            )
            .toList(),
      };
    }

    if (value is MultipartFile) {
      return <String, Object?>{
        '_chuckerType': 'multipartFile',
        'filename': value.filename,
        'contentType': value.contentType?.toString(),
        'length': value.length,
      };
    }

    if (value is Uint8List) {
      if (!captureBinaryBodies) {
        return '<binary body: ${value.lengthInBytes} bytes>';
      }
      return base64Encode(value);
    }

    if (value is List<int>) {
      if (!captureBinaryBodies) {
        return '<binary body: ${value.length} bytes>';
      }
      return base64Encode(value);
    }

    if (value is Map) {
      return value.map(
        (key, dynamic item) => MapEntry(
          key.toString(),
          _jsonSafeValue(item, captureBinaryBodies: captureBinaryBodies),
        ),
      );
    }

    if (value is Iterable) {
      return value
          .map(
            (item) =>
                _jsonSafeValue(item, captureBinaryBodies: captureBinaryBodies),
          )
          .toList();
    }

    return value.toString();
  }
}
