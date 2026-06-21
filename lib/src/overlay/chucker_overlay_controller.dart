import 'package:flutter/material.dart';

import '../core/repository/chucker_log_repository.dart';
import '../core/services/chucker_capture_service.dart';
import '../ui/chucker_screen.dart';
import 'chucker_overlay_button.dart';

class ChuckerOverlayController {
  OverlayEntry? _entry;

  bool get isShowing => _entry != null;

  Future<void> show({
    required GlobalKey<NavigatorState> navigatorKey,
    required ChuckerLogRepository repository,
    required ChuckerCaptureService captureService,
    required Future<void> Function() onOpenLogs,
    required Future<void> Function() onClearLogs,
  }) async {
    if (_entry != null) {
      return;
    }

    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        show(
          navigatorKey: navigatorKey,
          repository: repository,
          captureService: captureService,
          onOpenLogs: onOpenLogs,
          onClearLogs: onClearLogs,
        );
      });
      return;
    }

    _entry = OverlayEntry(
      builder: (context) => ChuckerOverlayButton(
        repository: repository,
        captureService: captureService,
        onOpenLogs: onOpenLogs,
        onClearLogs: onClearLogs,
      ),
    );
    overlay.insert(_entry!);
  }

  Future<void> openDashboard({
    required GlobalKey<NavigatorState> navigatorKey,
    required ChuckerLogRepository repository,
  }) async {
    final state = navigatorKey.currentState;
    if (state == null) {
      return;
    }

    await state.push<void>(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => ChuckerScreen(repository: repository),
      ),
    );
  }

  void hide() {
    _entry?.remove();
    _entry = null;
  }
}
