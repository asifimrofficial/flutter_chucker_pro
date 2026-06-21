import 'package:share_plus/share_plus.dart';

import '../models/chucker_http_record.dart';
import 'chucker_curl_exporter.dart';
import 'chucker_json_exporter.dart';

class ChuckerShareService {
  const ChuckerShareService({
    ChuckerCurlExporter curlExporter = const ChuckerCurlExporter(),
  }) : _curlExporter = curlExporter;

  final ChuckerCurlExporter _curlExporter;

  Future<ShareResult> shareRequest(ChuckerHttpRecord record) {
    return SharePlus.instance.share(
      ShareParams(
        title: 'Flutter Chucker request',
        subject: '${record.method} ${record.routeLabel}',
        text: _requestText(record),
      ),
    );
  }

  Future<ShareResult> shareResponse(ChuckerHttpRecord record) {
    return SharePlus.instance.share(
      ShareParams(
        title: 'Flutter Chucker response',
        subject: '${record.method} ${record.routeLabel}',
        text:
            record.responseBody ?? record.error ?? 'No response body captured.',
      ),
    );
  }

  Future<ShareResult> shareCurl(ChuckerHttpRecord record) {
    return SharePlus.instance.share(
      ShareParams(
        title: 'cURL',
        subject: '${record.method} ${record.routeLabel}',
        text: _curlExporter.generate(record),
      ),
    );
  }

  Future<ShareResult> shareJsonExport(ChuckerJsonExporter exporter) async {
    final file = await exporter.exportJsonFile();
    return SharePlus.instance.share(
      ShareParams(
        title: 'Flutter Chucker session export',
        subject: 'Flutter Chucker session export',
        files: <XFile>[file],
      ),
    );
  }

  String _requestText(ChuckerHttpRecord record) {
    return <String>[
      '${record.method} ${record.url}',
      'Status: ${record.statusLabel}',
      'Duration: ${record.durationMs}ms',
      if (record.requestBody != null) '',
      if (record.requestBody != null) record.requestBody!,
    ].join('\n');
  }
}
