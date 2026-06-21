import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/export/chucker_curl_exporter.dart';
import '../core/export/chucker_share_service.dart';
import '../core/models/chucker_http_record.dart';
import 'widgets/chucker_formatters.dart';

class ChuckerRequestDetailsScreen extends StatelessWidget {
  const ChuckerRequestDetailsScreen({
    super.key,
    required this.record,
    ChuckerCurlExporter curlExporter = const ChuckerCurlExporter(),
    ChuckerShareService shareService = const ChuckerShareService(),
  }) : _curlExporter = curlExporter,
       _shareService = shareService;

  final ChuckerHttpRecord record;
  final ChuckerCurlExporter _curlExporter;
  final ChuckerShareService _shareService;

  @override
  Widget build(BuildContext context) {
    final color = statusColor(context, record);
    final curl = _curlExporter.generate(record);

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: <Widget>[
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '${record.method} ${record.routeLabel}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              tooltip: 'Copy cURL',
              onPressed: () => _copy(context, curl),
              icon: const Icon(Icons.copy_rounded),
            ),
            PopupMenuButton<_ShareAction>(
              tooltip: 'Share',
              icon: const Icon(Icons.ios_share_rounded),
              onSelected: (action) => _share(action),
              itemBuilder: (context) => const <PopupMenuEntry<_ShareAction>>[
                PopupMenuItem(
                  value: _ShareAction.request,
                  child: Text('Request'),
                ),
                PopupMenuItem(
                  value: _ShareAction.response,
                  child: Text('Response'),
                ),
                PopupMenuItem(value: _ShareAction.curl, child: Text('cURL')),
              ],
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: 'Overview'),
              Tab(text: 'Request'),
              Tab(text: 'Response'),
              Tab(text: 'Headers'),
              Tab(text: 'Timeline'),
              Tab(text: 'cURL'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _OverviewTab(record: record),
            _PayloadTab(title: 'Request Body', payload: record.requestBody),
            _PayloadTab(title: 'Response Body', payload: record.responseBody),
            _HeadersTab(record: record),
            _TimelineTab(record: record),
            _CurlTab(
              curl: curl,
              onCopy: () => _copy(context, curl),
              onShare: () => _share(_ShareAction.curl),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _copy(BuildContext context, String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Copied')));
  }

  Future<void> _share(_ShareAction action) {
    return switch (action) {
      _ShareAction.request => _shareService.shareRequest(record),
      _ShareAction.response => _shareService.shareResponse(record),
      _ShareAction.curl => _shareService.shareCurl(record),
    };
  }
}

enum _ShareAction { request, response, curl }

class _OverviewTab extends StatelessWidget {
  const _OverviewTab({required this.record});

  final ChuckerHttpRecord record;

  @override
  Widget build(BuildContext context) {
    return _TabScaffold(
      children: <Widget>[
        _Section(
          title: 'Overview',
          children: <Widget>[
            _KeyValue(label: 'URL', value: record.url),
            _KeyValue(label: 'Method', value: record.method),
            _KeyValue(label: 'Status', value: record.statusLabel),
            _KeyValue(
              label: 'Duration',
              value: formatDurationMs(record.durationMs),
            ),
            _KeyValue(
              label: 'Request Size',
              value: formatBytes(record.requestSize),
            ),
            _KeyValue(
              label: 'Response Size',
              value: formatBytes(record.responseSize),
            ),
            if (record.contentType != null)
              _KeyValue(label: 'Content Type', value: record.contentType!),
          ],
        ),
        if (record.error != null)
          _Section(
            title: 'Error',
            children: <Widget>[
              if (record.errorType != null)
                _KeyValue(label: 'Type', value: record.errorType!),
              _KeyValue(label: 'Message', value: record.error!),
            ],
          ),
      ],
    );
  }
}

class _PayloadTab extends StatelessWidget {
  const _PayloadTab({required this.title, required this.payload});

  final String title;
  final String? payload;

  @override
  Widget build(BuildContext context) {
    return _TabScaffold(
      children: <Widget>[
        _Section(
          title: title,
          children: <Widget>[
            SelectableText(
              prettyPayload(payload),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontFamily: 'monospace'),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeadersTab extends StatelessWidget {
  const _HeadersTab({required this.record});

  final ChuckerHttpRecord record;

  @override
  Widget build(BuildContext context) {
    return _TabScaffold(
      children: <Widget>[
        _HeaderTable(title: 'Request Headers', headers: record.requestHeaders),
        _HeaderTable(
          title: 'Response Headers',
          headers: record.responseHeaders,
        ),
      ],
    );
  }
}

class _TimelineTab extends StatelessWidget {
  const _TimelineTab({required this.record});

  final ChuckerHttpRecord record;

  @override
  Widget build(BuildContext context) {
    return _TabScaffold(
      children: <Widget>[
        _Section(
          title: 'Timeline',
          children: <Widget>[
            _TimelineRow(
              label: 'Request Started',
              timestamp: formatTimestamp(record.startedAt),
            ),
            _TimelineRow(
              label: 'Response Received',
              timestamp: formatTimestamp(record.endedAt),
            ),
            const Divider(height: 28),
            _KeyValue(
              label: 'Total Duration',
              value: formatDurationMs(record.durationMs),
            ),
          ],
        ),
      ],
    );
  }
}

class _CurlTab extends StatelessWidget {
  const _CurlTab({
    required this.curl,
    required this.onCopy,
    required this.onShare,
  });

  final String curl;
  final VoidCallback onCopy;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return _TabScaffold(
      children: <Widget>[
        Row(
          children: <Widget>[
            FilledButton.icon(
              onPressed: onCopy,
              icon: const Icon(Icons.copy_rounded),
              label: const Text('Copy'),
            ),
            const SizedBox(width: 8),
            OutlinedButton.icon(
              onPressed: onShare,
              icon: const Icon(Icons.ios_share_rounded),
              label: const Text('Share'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _Section(
          title: 'cURL',
          children: <Widget>[
            SelectableText(
              curl,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontFamily: 'monospace'),
            ),
          ],
        ),
      ],
    );
  }
}

class _TabScaffold extends StatelessWidget {
  const _TabScaffold({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(16), children: children);
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class _KeyValue extends StatelessWidget {
  const _KeyValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 116,
            child: Text(label, style: theme.textTheme.labelLarge),
          ),
          Expanded(
            child: SelectableText(value, style: theme.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}

class _HeaderTable extends StatelessWidget {
  const _HeaderTable({required this.title, required this.headers});

  final String title;
  final Map<String, Object?> headers;

  @override
  Widget build(BuildContext context) {
    if (headers.isEmpty) {
      return _Section(
        title: title,
        children: const <Widget>[Text('No headers captured.')],
      );
    }

    return _Section(
      title: title,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 36,
            dataRowMinHeight: 40,
            dataRowMaxHeight: 72,
            columns: const <DataColumn>[
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Value')),
            ],
            rows: headers.entries
                .map(
                  (entry) => DataRow(
                    cells: <DataCell>[
                      DataCell(SelectableText(entry.key)),
                      DataCell(SelectableText(entry.value?.toString() ?? '')),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({required this.label, required this.timestamp});

  final String label;
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: <Widget>[
          const Icon(Icons.radio_button_checked_rounded, size: 16),
          const SizedBox(width: 10),
          Expanded(child: Text(label, style: theme.textTheme.labelLarge)),
          SelectableText(timestamp),
        ],
      ),
    );
  }
}
