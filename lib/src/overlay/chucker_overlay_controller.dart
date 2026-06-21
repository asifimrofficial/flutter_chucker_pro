import 'package:flutter/material.dart';

import '../core/repository/chucker_log_repository.dart';
import '../core/services/chucker_capture_service.dart';
import '../ui/chucker_screen.dart';
import 'chucker_overlay_button.dart';

class ChuckerOverlayController {
  static const int _maxAttachAttempts = 12;

  OverlayEntry? _entry;
  VoidCallback? _entryListener;

  bool get isShowing => _entry?.mounted ?? false;

  Future<void> show({
    required GlobalKey<NavigatorState> navigatorKey,
    required ChuckerLogRepository repository,
    required ChuckerCaptureService captureService,
    required Future<void> Function() onOpenLogs,
    required Future<void> Function() onClearLogs,
  }) {
    return _show(
      navigatorKey: navigatorKey,
      repository: repository,
      captureService: captureService,
      onOpenLogs: onOpenLogs,
      onClearLogs: onClearLogs,
    );
  }

  Future<void> _show({
    required GlobalKey<NavigatorState> navigatorKey,
    required ChuckerLogRepository repository,
    required ChuckerCaptureService captureService,
    required Future<void> Function() onOpenLogs,
    required Future<void> Function() onClearLogs,
    int attempt = 0,
  }) async {
    _clearStaleEntry();

    if (_entry?.mounted ?? false) {
      return;
    }

    final overlay = _overlayFor(navigatorKey);
    if (overlay == null) {
      if (attempt >= _maxAttachAttempts) {
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _show(
          navigatorKey: navigatorKey,
          repository: repository,
          captureService: captureService,
          onOpenLogs: onOpenLogs,
          onClearLogs: onClearLogs,
          attempt: attempt + 1,
        );
      });
      return;
    }

    late final OverlayEntry entry;
    void handleMountChange() {
      if (entry.mounted || !identical(_entry, entry)) {
        return;
      }

      entry.removeListener(handleMountChange);
      _entry = null;
      _entryListener = null;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _show(
          navigatorKey: navigatorKey,
          repository: repository,
          captureService: captureService,
          onOpenLogs: onOpenLogs,
          onClearLogs: onClearLogs,
        );
      });
    }

    entry = OverlayEntry(
      builder: (context) => ChuckerOverlayButton(
        repository: repository,
        captureService: captureService,
        onOpenLogs: onOpenLogs,
        onClearLogs: onClearLogs,
      ),
    );
    entry.addListener(handleMountChange);
    _entry = entry;
    _entryListener = handleMountChange;
    overlay.insert(entry);
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
    final listener = _entryListener;
    if (listener != null) {
      _entry?.removeListener(listener);
    }
    _entry?.remove();
    _entry = null;
    _entryListener = null;
  }

  OverlayState? _overlayFor(GlobalKey<NavigatorState> navigatorKey) {
    final stateOverlay = navigatorKey.currentState?.overlay;
    if (stateOverlay != null) {
      return stateOverlay;
    }

    final context = navigatorKey.currentContext;
    if (context == null) {
      return null;
    }
    return Overlay.maybeOf(context, rootOverlay: true);
  }

  void _clearStaleEntry() {
    final entry = _entry;
    if (entry != null && !entry.mounted) {
      final listener = _entryListener;
      if (listener != null) {
        entry.removeListener(listener);
      }
      _entry = null;
      _entryListener = null;
    }
  }
}
