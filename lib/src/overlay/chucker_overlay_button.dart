import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/models/chucker_stats.dart';
import '../core/repository/chucker_log_repository.dart';
import '../core/services/chucker_capture_service.dart';

class ChuckerOverlayButton extends StatefulWidget {
  const ChuckerOverlayButton({
    super.key,
    required this.repository,
    required this.captureService,
    required this.onOpenLogs,
    required this.onClearLogs,
  });

  final ChuckerLogRepository repository;
  final ChuckerCaptureService captureService;
  final Future<void> Function() onOpenLogs;
  final Future<void> Function() onClearLogs;

  @override
  State<ChuckerOverlayButton> createState() => _ChuckerOverlayButtonState();
}

class _ChuckerOverlayButtonState extends State<ChuckerOverlayButton> {
  static const String _xKey = 'flutter_chucker_overlay_x';
  static const String _yKey = 'flutter_chucker_overlay_y';
  static const double _margin = 12;
  static const Size _collapsedSize = Size(76, 48);
  static const Size _expandedSize = Size(208, 188);

  final SharedPreferencesAsync _preferences = SharedPreferencesAsync();
  Offset _position = const Offset(_margin, 140);
  bool _expanded = false;

  Size get _currentSize => _expanded ? _expandedSize : _collapsedSize;

  @override
  void initState() {
    super.initState();
    widget.captureService.addListener(_onCaptureStateChanged);
    unawaited(_restorePosition());
  }

  @override
  void didUpdateWidget(covariant ChuckerOverlayButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.captureService != widget.captureService) {
      oldWidget.captureService.removeListener(_onCaptureStateChanged);
      widget.captureService.addListener(_onCaptureStateChanged);
    }
  }

  @override
  void dispose() {
    widget.captureService.removeListener(_onCaptureStateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;
    final padding = mediaQuery.padding;
    final clampedPosition = _clamp(_position, screenSize, padding);

    if (clampedPosition != _position) {
      _position = clampedPosition;
    }

    return Positioned(
      left: _position.dx,
      top: _position.dy,
      child: StreamBuilder<ChuckerStats>(
        stream: widget.repository.watchStats(),
        initialData: const ChuckerStats.empty(),
        builder: (context, snapshot) {
          final stats = snapshot.data ?? const ChuckerStats.empty();
          return GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _position = _clamp(
                  _position + details.delta,
                  screenSize,
                  padding,
                );
              });
            },
            onPanEnd: (_) => _snapToEdge(screenSize, padding),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutCubic,
              alignment: Alignment.topLeft,
              child: _expanded
                  ? _ExpandedOverlay(
                      stats: stats,
                      isPaused: widget.captureService.isPaused,
                      onCollapse: _toggleExpanded,
                      onOpenLogs: widget.onOpenLogs,
                      onClearLogs: widget.onClearLogs,
                      onToggleCapture: _toggleCapture,
                    )
                  : _CollapsedOverlay(
                      stats: stats,
                      isPaused: widget.captureService.isPaused,
                      onTap: _toggleExpanded,
                    ),
            ),
          );
        },
      ),
    );
  }

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final mediaQuery = MediaQuery.of(context);
        _snapToEdge(mediaQuery.size, mediaQuery.padding);
      }
    });
  }

  void _toggleCapture() {
    if (widget.captureService.isPaused) {
      widget.captureService.resume();
    } else {
      widget.captureService.pause();
    }
  }

  void _onCaptureStateChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  Offset _clamp(Offset position, Size screenSize, EdgeInsets padding) {
    final size = _currentSize;
    final minX = _margin;
    final maxX = screenSize.width - size.width - _margin;
    final minY = padding.top + _margin;
    final maxY = screenSize.height - size.height - padding.bottom - _margin;

    return Offset(
      position.dx.clamp(minX, maxX < minX ? minX : maxX),
      position.dy.clamp(minY, maxY < minY ? minY : maxY),
    );
  }

  void _snapToEdge(Size screenSize, EdgeInsets padding) {
    final size = _currentSize;
    final snapLeft = _position.dx + size.width / 2 < screenSize.width / 2;
    final nextX = snapLeft ? _margin : screenSize.width - size.width - _margin;
    setState(() {
      _position = _clamp(Offset(nextX, _position.dy), screenSize, padding);
    });
    unawaited(_savePosition());
  }

  Future<void> _restorePosition() async {
    final x = await _preferences.getDouble(_xKey);
    final y = await _preferences.getDouble(_yKey);
    if (!mounted || x == null || y == null) {
      return;
    }
    setState(() {
      _position = Offset(x, y);
    });
  }

  Future<void> _savePosition() async {
    await _preferences.setDouble(_xKey, _position.dx);
    await _preferences.setDouble(_yKey, _position.dy);
  }
}

class _CollapsedOverlay extends StatelessWidget {
  const _CollapsedOverlay({
    required this.stats,
    required this.isPaused,
    required this.onTap,
  });

  final ChuckerStats stats;
  final bool isPaused;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasErrors = stats.hasErrors;
    final statusColor = isPaused
        ? colorScheme.outline
        : hasErrors
        ? colorScheme.error
        : Colors.green.shade600;

    return Material(
      elevation: 12,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          width: _ChuckerOverlayButtonState._collapsedSize.width,
          height: _ChuckerOverlayButtonState._collapsedSize.height,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: colorScheme.outlineVariant),
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 18,
                offset: const Offset(0, 8),
                color: Colors.black.withValues(alpha: 0.16),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  stats.totalRequests.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              if (stats.errorRequests > 0) ...<Widget>[
                const SizedBox(width: 5),
                Text(
                  '${stats.errorRequests} ERR',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.error,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ExpandedOverlay extends StatelessWidget {
  const _ExpandedOverlay({
    required this.stats,
    required this.isPaused,
    required this.onCollapse,
    required this.onOpenLogs,
    required this.onClearLogs,
    required this.onToggleCapture,
  });

  final ChuckerStats stats;
  final bool isPaused;
  final VoidCallback onCollapse;
  final Future<void> Function() onOpenLogs;
  final Future<void> Function() onClearLogs;
  final VoidCallback onToggleCapture;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      elevation: 16,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: _ChuckerOverlayButtonState._expandedSize.width,
        height: _ChuckerOverlayButtonState._expandedSize.height,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colorScheme.outlineVariant),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 24,
              offset: const Offset(0, 12),
              color: Colors.black.withValues(alpha: 0.18),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Chucker',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                IconButton(
                  tooltip: 'Collapse',
                  visualDensity: VisualDensity.compact,
                  onPressed: onCollapse,
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: <Widget>[
                _Metric(label: 'Requests', value: stats.totalRequests),
                _Metric(label: 'Errors', value: stats.errorRequests),
                _Metric(label: 'Slow', value: stats.slowRequests),
              ],
            ),
            const SizedBox(height: 8),
            _OverlayAction(
              icon: Icons.open_in_full_rounded,
              label: 'Open Logs',
              onPressed: onOpenLogs,
            ),
            _OverlayAction(
              icon: Icons.delete_sweep_rounded,
              label: 'Clear Logs',
              onPressed: onClearLogs,
            ),
            _OverlayAction(
              icon: isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
              label: isPaused ? 'Resume Capture' : 'Pause Capture',
              onPressed: () async => onToggleCapture(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            value.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}

class _OverlayAction extends StatelessWidget {
  const _OverlayAction({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: TextButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Align(
          alignment: Alignment.centerLeft,
          child: Text(label, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
