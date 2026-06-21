import 'dart:convert';

import '../models/chucker_http_record.dart';

class ChuckerCurlExporter {
  const ChuckerCurlExporter();

  String generate(ChuckerHttpRecord record) {
    final lines = <String>[
      'curl --request ${record.method.toUpperCase()} ${_quote(record.url)}',
    ];

    for (final entry in record.requestHeaders.entries) {
      final value = entry.value;
      if (value == null) {
        continue;
      }
      lines.add('--header ${_quote('${entry.key}: ${_flatten(value)}')}');
    }

    final body = record.requestBody;
    if (body != null && body.isNotEmpty) {
      if (_appendMultipart(lines, body)) {
        return lines.join(' \\\n  ');
      }
      lines.add('--data-raw ${_quote(body)}');
    }

    return lines.join(' \\\n  ');
  }

  bool _appendMultipart(List<String> lines, String rawBody) {
    final decoded = _tryDecodeJson(rawBody);
    if (decoded is! Map<String, dynamic> ||
        decoded['_chuckerType'] != 'formData') {
      return false;
    }

    final fields = decoded['fields'];
    if (fields is List) {
      for (final field in fields.whereType<Map>()) {
        final name = field['name'];
        final value = field['value'];
        if (name != null) {
          lines.add('--form ${_quote('$name=${value ?? ''}')}');
        }
      }
    }

    final files = decoded['files'];
    if (files is List) {
      for (final file in files.whereType<Map>()) {
        final name = file['name'];
        final filename = file['filename'] ?? 'file';
        if (name != null) {
          lines.add('--form ${_quote('$name=@$filename')}');
        }
      }
    }

    return true;
  }

  Object? _tryDecodeJson(String value) {
    try {
      return jsonDecode(value);
    } on FormatException {
      return null;
    }
  }

  String _flatten(Object value) {
    if (value is Iterable) {
      return value.join(', ');
    }
    return value.toString();
  }

  String _quote(String value) => "'${value.replaceAll("'", "'\"'\"'")}'";
}
