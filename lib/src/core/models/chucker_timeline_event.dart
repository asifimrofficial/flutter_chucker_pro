import 'package:flutter/foundation.dart';

/// Common shape for future unified timeline events.
///
/// Network requests use the same vocabulary as planned BLoC, navigation,
/// crash, analytics, and custom event sources.
@immutable
class ChuckerTimelineEvent {
  const ChuckerTimelineEvent({
    required this.id,
    required this.source,
    required this.title,
    required this.timestamp,
    this.subtitle,
    this.metadata = const <String, Object?>{},
  });

  final String id;
  final String source;
  final String title;
  final String? subtitle;
  final DateTime timestamp;
  final Map<String, Object?> metadata;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'source': source,
      'title': title,
      'subtitle': subtitle,
      'timestamp': timestamp.toIso8601String(),
      'metadata': metadata,
    };
  }
}

abstract interface class ChuckerEventSource {
  String get name;

  Stream<ChuckerTimelineEvent> get events;
}

class ChuckerEventRegistry {
  ChuckerEventRegistry();

  final List<ChuckerEventSource> _sources = <ChuckerEventSource>[];

  List<ChuckerEventSource> get sources => List.unmodifiable(_sources);

  void register(ChuckerEventSource source) {
    if (_sources.any((item) => item.name == source.name)) {
      return;
    }
    _sources.add(source);
  }

  void unregister(String name) {
    _sources.removeWhere((source) => source.name == name);
  }
}
