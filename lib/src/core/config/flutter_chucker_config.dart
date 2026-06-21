import 'package:flutter/foundation.dart';

/// Runtime configuration for Flutter Chucker Pro.
@immutable
class FlutterChuckerConfig {
  const FlutterChuckerConfig({
    this.enabled = true,
    this.showOverlayOnStart = true,
    this.maxStoredRequests = 1000,
    this.pageSize = 40,
    this.captureRequestBody = true,
    this.captureResponseBody = true,
    this.captureBinaryBodies = false,
    this.maxBodyBytes = 512 * 1024,
    this.slowRequestThreshold = const Duration(milliseconds: 700),
    this.maskedHeaders = const <String>[
      'authorization',
      'cookie',
      'set-cookie',
      'x-api-key',
      'proxy-authorization',
    ],
    this.sessionId,
  });

  /// Whether capture is enabled at all.
  final bool enabled;

  /// Whether the floating overlay is inserted after initialization.
  final bool showOverlayOnStart;

  /// Maximum number of requests retained before oldest entries are purged.
  final int maxStoredRequests;

  /// Default UI page size for lazy loading.
  final int pageSize;

  /// Whether outgoing request bodies are persisted.
  final bool captureRequestBody;

  /// Whether incoming response bodies are persisted.
  final bool captureResponseBody;

  /// Binary payloads can be expensive and sensitive, so they are off by default.
  final bool captureBinaryBodies;

  /// Maximum serialized payload size retained per request or response.
  final int maxBodyBytes;

  /// Requests at or above this duration are marked as slow.
  final Duration slowRequestThreshold;

  /// Case-insensitive header names that should be replaced with `*****`.
  final List<String> maskedHeaders;

  /// Optional stable session id supplied by the host app.
  final String? sessionId;

  Set<String> get normalizedMaskedHeaders =>
      maskedHeaders.map((header) => header.toLowerCase()).toSet();

  FlutterChuckerConfig copyWith({
    bool? enabled,
    bool? showOverlayOnStart,
    int? maxStoredRequests,
    int? pageSize,
    bool? captureRequestBody,
    bool? captureResponseBody,
    bool? captureBinaryBodies,
    int? maxBodyBytes,
    Duration? slowRequestThreshold,
    List<String>? maskedHeaders,
    String? sessionId,
  }) {
    return FlutterChuckerConfig(
      enabled: enabled ?? this.enabled,
      showOverlayOnStart: showOverlayOnStart ?? this.showOverlayOnStart,
      maxStoredRequests: maxStoredRequests ?? this.maxStoredRequests,
      pageSize: pageSize ?? this.pageSize,
      captureRequestBody: captureRequestBody ?? this.captureRequestBody,
      captureResponseBody: captureResponseBody ?? this.captureResponseBody,
      captureBinaryBodies: captureBinaryBodies ?? this.captureBinaryBodies,
      maxBodyBytes: maxBodyBytes ?? this.maxBodyBytes,
      slowRequestThreshold: slowRequestThreshold ?? this.slowRequestThreshold,
      maskedHeaders: maskedHeaders ?? this.maskedHeaders,
      sessionId: sessionId ?? this.sessionId,
    );
  }
}
