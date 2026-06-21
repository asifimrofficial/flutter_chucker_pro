import 'package:flutter/material.dart';

import '../../overlay/chucker_overlay_controller.dart';
import '../config/flutter_chucker_config.dart';
import '../export/chucker_json_exporter.dart';
import '../repository/chucker_log_repository.dart';
import '../repository/isar_chucker_log_repository.dart';
import 'chucker_capture_service.dart';

abstract final class FlutterChucker {
  static FlutterChuckerController get instance =>
      FlutterChuckerController.instance;

  static Future<void> initialize({
    GlobalKey<NavigatorState>? navigatorKey,
    FlutterChuckerConfig config = const FlutterChuckerConfig(),
    ChuckerLogRepository? repository,
  }) {
    return instance.initialize(
      navigatorKey: navigatorKey,
      config: config,
      repository: repository,
    );
  }

  static bool get isInitialized => instance.isInitialized;

  static FlutterChuckerConfig get config => instance.config;

  static ChuckerLogRepository get repository => instance.repository;

  static ChuckerCaptureService? get captureService =>
      instance.captureServiceOrNull;

  static void pause() => instance.pause();

  static void resume() => instance.resume();

  static Future<void> clear() => instance.clear();

  static Future<void> show() => instance.show();

  static Future<void> showOverlay() => instance.showOverlay();

  static void hideOverlay() => instance.hideOverlay();

  static Future<String> exportJson({int limit = 10000}) {
    return instance.exportJson(limit: limit);
  }
}

class FlutterChuckerController {
  FlutterChuckerController._();

  static final FlutterChuckerController instance = FlutterChuckerController._();

  final ChuckerOverlayController overlayController = ChuckerOverlayController();

  FlutterChuckerConfig _config = const FlutterChuckerConfig();
  ChuckerLogRepository? _repository;
  ChuckerCaptureService? _captureService;
  GlobalKey<NavigatorState>? _navigatorKey;
  bool _ownsRepository = false;

  bool get isInitialized => _repository != null && _captureService != null;

  FlutterChuckerConfig get config => _config;

  ChuckerLogRepository get repository {
    final repository = _repository;
    if (repository == null) {
      throw StateError(
        'FlutterChucker.initialize() must be called before accessing repository.',
      );
    }
    return repository;
  }

  ChuckerCaptureService get captureService {
    final service = _captureService;
    if (service == null) {
      throw StateError(
        'FlutterChucker.initialize() must be called before capturing requests.',
      );
    }
    return service;
  }

  ChuckerCaptureService? get captureServiceOrNull => _captureService;

  Future<void> initialize({
    GlobalKey<NavigatorState>? navigatorKey,
    FlutterChuckerConfig config = const FlutterChuckerConfig(),
    ChuckerLogRepository? repository,
  }) async {
    await _closeOwnedRepositoryIfNeeded();

    final resolvedConfig = config.copyWith(
      sessionId: config.sessionId ?? _createSessionId(),
    );

    _config = resolvedConfig;
    _navigatorKey = navigatorKey;
    _repository = repository ?? await IsarChuckerLogRepository.open();
    _ownsRepository = repository == null;
    _captureService = ChuckerCaptureService(
      repository: _repository!,
      config: resolvedConfig,
    );

    if (navigatorKey != null && resolvedConfig.showOverlayOnStart) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showOverlay();
      });
    }
  }

  void pause() => captureService.pause();

  void resume() => captureService.resume();

  Future<void> clear() => repository.clear();

  Future<void> show() async {
    final key = _navigatorKey;
    if (key == null) {
      throw StateError(
        'FlutterChucker.show() requires a navigatorKey supplied to initialize().',
      );
    }
    await overlayController.openDashboard(
      navigatorKey: key,
      repository: repository,
    );
  }

  Future<void> showOverlay() async {
    final key = _navigatorKey;
    final service = _captureService;
    if (key == null || service == null) {
      return;
    }

    await overlayController.show(
      navigatorKey: key,
      repository: repository,
      captureService: service,
      onOpenLogs: show,
      onClearLogs: clear,
    );
  }

  void hideOverlay() => overlayController.hide();

  Future<String> exportJson({int limit = 10000}) {
    return ChuckerJsonExporter(
      repository,
    ).exportJson(sessionId: _config.sessionId, limit: limit);
  }

  Future<void> dispose() async {
    hideOverlay();
    await _closeOwnedRepositoryIfNeeded();
    _repository = null;
    _captureService = null;
  }

  Future<void> _closeOwnedRepositoryIfNeeded() async {
    if (_ownsRepository) {
      await _repository?.close();
    }
    _ownsRepository = false;
  }

  String _createSessionId() {
    return 'session-${DateTime.now().toUtc().microsecondsSinceEpoch}';
  }
}
