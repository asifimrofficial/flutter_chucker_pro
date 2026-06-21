import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/models/chucker_http_record.dart';

String formatDurationMs(int milliseconds) => '${milliseconds}ms';

String formatBytes(int bytes) {
  if (bytes < 1024) {
    return '$bytes B';
  }
  final kb = bytes / 1024;
  if (kb < 1024) {
    return '${kb.toStringAsFixed(kb >= 100 ? 0 : 1)} KB';
  }
  final mb = kb / 1024;
  return '${mb.toStringAsFixed(mb >= 100 ? 0 : 1)} MB';
}

String formatTimestamp(DateTime timestamp) {
  final local = timestamp.toLocal();
  String two(int value) => value.toString().padLeft(2, '0');
  String three(int value) => value.toString().padLeft(3, '0');
  return '${local.year}-${two(local.month)}-${two(local.day)} '
      '${two(local.hour)}:${two(local.minute)}:${two(local.second)}.'
      '${three(local.millisecond)}';
}

String prettyPayload(String? raw) {
  if (raw == null || raw.isEmpty) {
    return 'No body captured.';
  }
  try {
    return const JsonEncoder.withIndent('  ').convert(jsonDecode(raw));
  } on Object {
    return raw;
  }
}

Color statusColor(BuildContext context, ChuckerHttpRecord record) {
  final colorScheme = Theme.of(context).colorScheme;
  if (record.isCancelled) {
    return colorScheme.outline;
  }
  final code = record.statusCode;
  if (code == null) {
    return record.hasError ? colorScheme.error : colorScheme.outline;
  }
  if (code >= 200 && code < 300) {
    return Colors.green.shade600;
  }
  if (code >= 400 && code < 500) {
    return Colors.orange.shade700;
  }
  if (code >= 500) {
    return colorScheme.error;
  }
  return colorScheme.primary;
}
