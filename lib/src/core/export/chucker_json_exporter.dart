import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';

import '../models/chucker_http_record.dart';
import '../repository/chucker_log_repository.dart';

class ChuckerJsonExporter {
  const ChuckerJsonExporter(this.repository);

  final ChuckerLogRepository repository;

  Future<String> exportJson({String? sessionId, int limit = 10000}) async {
    final records = await repository.exportAll(limit: limit);
    final payload = <String, Object?>{
      'sessionId': sessionId ?? _sessionIdFromRecords(records),
      'createdAt': DateTime.now().toUtc().toIso8601String(),
      'requestCount': records.length,
      'requests': records.map((record) => record.toJson()).toList(),
    };
    return compute(_encodeSessionJson, payload);
  }

  Future<XFile> exportJsonFile({
    String? sessionId,
    int limit = 10000,
    String? fileName,
  }) async {
    final json = await exportJson(sessionId: sessionId, limit: limit);
    return XFile.fromData(
      Uint8List.fromList(utf8.encode(json)),
      name:
          fileName ??
          'flutter-chucker-${DateTime.now().millisecondsSinceEpoch}.json',
      mimeType: 'application/json',
    );
  }

  String _sessionIdFromRecords(List<ChuckerHttpRecord> records) {
    if (records.isNotEmpty) {
      return records.first.sessionId;
    }
    return 'session-${DateTime.now().toUtc().microsecondsSinceEpoch}';
  }
}

String _encodeSessionJson(Map<String, Object?> payload) {
  return const JsonEncoder.withIndent('  ').convert(payload);
}
