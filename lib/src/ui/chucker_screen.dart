import 'dart:async';

import 'package:flutter/material.dart';

import '../core/export/chucker_json_exporter.dart';
import '../core/export/chucker_share_service.dart';
import '../core/models/chucker_http_record.dart';
import '../core/models/chucker_log_query.dart';
import '../core/models/chucker_stats.dart';
import '../core/repository/chucker_log_repository.dart';
import '../core/services/flutter_chucker.dart';
import 'chucker_request_details_screen.dart';
import 'widgets/chucker_formatters.dart';

class ChuckerScreen extends StatefulWidget {
  ChuckerScreen({
    super.key,
    ChuckerLogRepository? repository,
    this.pageSize = 40,
  }) : repository = repository ?? FlutterChucker.repository;

  final ChuckerLogRepository repository;
  final int pageSize;

  @override
  State<ChuckerScreen> createState() => _ChuckerScreenState();
}

class _ChuckerScreenState extends State<ChuckerScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final ChuckerShareService _shareService = const ChuckerShareService();

  ChuckerLogQuery _query = const ChuckerLogQuery();
  List<ChuckerHttpRecord> _records = <ChuckerHttpRecord>[];
  StreamSubscription<ChuckerStats>? _statsSubscription;
  Timer? _searchDebounce;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _statsSubscription = widget.repository.watchStats().listen((_) {
      if (mounted && !_isLoading) {
        unawaited(_loadFirstPage());
      }
    });
    unawaited(_loadFirstPage());
  }

  @override
  void dispose() {
    _statsSubscription?.cancel();
    _searchDebounce?.cancel();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Logs'),
        actions: <Widget>[
          PopupMenuButton<ChuckerSortOrder>(
            tooltip: 'Sort',
            icon: const Icon(Icons.sort_rounded),
            initialValue: _query.sortOrder,
            onSelected: (order) =>
                _updateQuery(_query.copyWith(sortOrder: order)),
            itemBuilder: (context) => const <PopupMenuEntry<ChuckerSortOrder>>[
              PopupMenuItem(
                value: ChuckerSortOrder.newest,
                child: Text('Newest first'),
              ),
              PopupMenuItem(
                value: ChuckerSortOrder.oldest,
                child: Text('Oldest first'),
              ),
              PopupMenuItem(
                value: ChuckerSortOrder.durationDesc,
                child: Text('Slowest first'),
              ),
              PopupMenuItem(
                value: ChuckerSortOrder.durationAsc,
                child: Text('Fastest first'),
              ),
            ],
          ),
          IconButton(
            tooltip: 'Share JSON',
            onPressed: _shareJsonExport,
            icon: const Icon(Icons.ios_share_rounded),
          ),
          IconButton(
            tooltip: 'Clear',
            onPressed: _clearLogs,
            icon: const Icon(Icons.delete_sweep_rounded),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StreamBuilder<ChuckerStats>(
            stream: widget.repository.watchStats(),
            initialData: const ChuckerStats.empty(),
            builder: (context, snapshot) {
              return _StatsHeader(
                stats: snapshot.data ?? const ChuckerStats.empty(),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: SearchBar(
              controller: _searchController,
              leading: const Icon(Icons.search_rounded),
              hintText: 'Search URL, method, status, error',
              onChanged: _onSearchChanged,
              trailing: _query.hasFilters
                  ? <Widget>[
                      IconButton(
                        tooltip: 'Reset filters',
                        onPressed: _resetFilters,
                        icon: const Icon(Icons.close_rounded),
                      ),
                    ]
                  : null,
            ),
          ),
          _Filters(query: _query, onChanged: _updateQuery),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: _records.isEmpty && !_isLoading
                  ? _EmptyState(
                      hasFilters: _query.hasFilters,
                      textStyle: theme.textTheme.bodyMedium,
                    )
                  : RefreshIndicator(
                      onRefresh: _loadFirstPage,
                      child: ListView.separated(
                        key: const PageStorageKey<String>('chucker_requests'),
                        controller: _scrollController,
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
                        itemCount: _records.length + (_hasMore ? 1 : 0),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          if (index >= _records.length) {
                            return const Padding(
                              padding: EdgeInsets.all(24),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          final record = _records[index];
                          return _RequestTile(
                            record: record,
                            onTap: () => _openDetails(record),
                          );
                        },
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter < 500) {
      unawaited(_loadNextPage());
    }
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 250), () {
      _updateQuery(_query.copyWith(search: value));
    });
  }

  Future<void> _loadFirstPage() async {
    if (_isLoading) {
      return;
    }
    setState(() {
      _isLoading = true;
      _hasMore = true;
    });
    final records = await widget.repository.getRequests(
      query: _query,
      limit: widget.pageSize,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _records = records;
      _hasMore = records.length == widget.pageSize;
      _isLoading = false;
    });
  }

  Future<void> _loadNextPage() async {
    if (_isLoading || !_hasMore) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    final records = await widget.repository.getRequests(
      query: _query,
      offset: _records.length,
      limit: widget.pageSize,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _records = <ChuckerHttpRecord>[..._records, ...records];
      _hasMore = records.length == widget.pageSize;
      _isLoading = false;
    });
  }

  void _updateQuery(ChuckerLogQuery query) {
    setState(() {
      _query = query;
    });
    unawaited(_loadFirstPage());
  }

  void _resetFilters() {
    _searchController.clear();
    _updateQuery(const ChuckerLogQuery());
  }

  Future<void> _clearLogs() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear logs?'),
        content: const Text(
          'All captured requests in this session store will be removed.',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
    if (confirmed != true) {
      return;
    }
    await widget.repository.clear();
    await _loadFirstPage();
  }

  Future<void> _shareJsonExport() async {
    await _shareService.shareJsonExport(ChuckerJsonExporter(widget.repository));
  }

  Future<void> _openDetails(ChuckerHttpRecord record) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => ChuckerRequestDetailsScreen(record: record),
      ),
    );
  }
}

class _StatsHeader extends StatelessWidget {
  const _StatsHeader({required this.stats});

  final ChuckerStats stats;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.48),
        border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Row(
            children: <Widget>[
              _HeaderMetric(label: 'Requests', value: stats.totalRequests),
              _HeaderMetric(label: 'Errors', value: stats.errorRequests),
              _HeaderMetric(label: 'Slow', value: stats.slowRequests),
              _HeaderMetric(label: 'Cancelled', value: stats.cancelledRequests),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderMetric extends StatelessWidget {
  const _HeaderMetric({required this.label, required this.value});

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
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

class _Filters extends StatelessWidget {
  const _Filters({required this.query, required this.onChanged});

  final ChuckerLogQuery query;
  final ValueChanged<ChuckerLogQuery> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _ChipGroup(
            children: <Widget>[
              _FilterChoice(
                label: 'All',
                selected: query.method == ChuckerHttpMethodFilter.all,
                onSelected: () => onChanged(
                  query.copyWith(method: ChuckerHttpMethodFilter.all),
                ),
              ),
              for (final method in ChuckerHttpMethodFilter.values.skip(1))
                _FilterChoice(
                  label: method.name.toUpperCase(),
                  selected: query.method == method,
                  onSelected: () => onChanged(query.copyWith(method: method)),
                ),
            ],
          ),
          const SizedBox(width: 10),
          _ChipGroup(
            children: <Widget>[
              _FilterChoice(
                label: '2xx',
                selected: query.status == ChuckerStatusFilter.success,
                onSelected: () => onChanged(
                  query.copyWith(
                    status: query.status == ChuckerStatusFilter.success
                        ? ChuckerStatusFilter.all
                        : ChuckerStatusFilter.success,
                  ),
                ),
              ),
              _FilterChoice(
                label: '4xx',
                selected: query.status == ChuckerStatusFilter.clientError,
                onSelected: () => onChanged(
                  query.copyWith(
                    status: query.status == ChuckerStatusFilter.clientError
                        ? ChuckerStatusFilter.all
                        : ChuckerStatusFilter.clientError,
                  ),
                ),
              ),
              _FilterChoice(
                label: '5xx',
                selected: query.status == ChuckerStatusFilter.serverError,
                onSelected: () => onChanged(
                  query.copyWith(
                    status: query.status == ChuckerStatusFilter.serverError
                        ? ChuckerStatusFilter.all
                        : ChuckerStatusFilter.serverError,
                  ),
                ),
              ),
              _FilterChoice(
                label: 'Cancelled',
                selected: query.status == ChuckerStatusFilter.cancelled,
                onSelected: () => onChanged(
                  query.copyWith(
                    status: query.status == ChuckerStatusFilter.cancelled
                        ? ChuckerStatusFilter.all
                        : ChuckerStatusFilter.cancelled,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          _ChipGroup(
            children: <Widget>[
              _FilterChoice(
                label: 'Fast',
                selected: query.performance == ChuckerPerformanceFilter.fast,
                onSelected: () => onChanged(
                  query.copyWith(
                    performance:
                        query.performance == ChuckerPerformanceFilter.fast
                        ? ChuckerPerformanceFilter.all
                        : ChuckerPerformanceFilter.fast,
                  ),
                ),
              ),
              _FilterChoice(
                label: 'Slow',
                selected: query.performance == ChuckerPerformanceFilter.slow,
                onSelected: () => onChanged(
                  query.copyWith(
                    performance:
                        query.performance == ChuckerPerformanceFilter.slow
                        ? ChuckerPerformanceFilter.all
                        : ChuckerPerformanceFilter.slow,
                  ),
                ),
              ),
              _FilterChoice(
                label: 'Errors Only',
                selected: query.errorsOnly,
                onSelected: () =>
                    onChanged(query.copyWith(errorsOnly: !query.errorsOnly)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChipGroup extends StatelessWidget {
  const _ChipGroup({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 8, runSpacing: 2, children: children);
  }
}

class _FilterChoice extends StatelessWidget {
  const _FilterChoice({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
      visualDensity: VisualDensity.compact,
    );
  }
}

class _RequestTile extends StatelessWidget {
  const _RequestTile({required this.record, required this.onTap});

  final ChuckerHttpRecord record;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final color = statusColor(context, record);

    return Material(
      color: colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Container(
                width: 4,
                height: 48,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          record.method,
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: color,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            record.routeLabel,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      record.host,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    record.statusLabel,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    formatDurationMs(record.durationMs),
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.hasFilters, this.textStyle});

  final bool hasFilters;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const ValueKey<String>('empty'),
      child: Text(
        hasFilters ? 'No matching requests.' : 'No requests captured yet.',
        style: textStyle,
      ),
    );
  }
}
