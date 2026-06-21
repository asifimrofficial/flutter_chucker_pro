import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_chucker_pro/flutter_chucker_pro.dart';
import 'package:flutter_chucker_pro/src/core/services/chucker_capture_service.dart';

void main() {
  test('Dio builder captures response metadata and masks headers', () {
    final requestOptions = RequestOptions(
      baseUrl: 'https://api.example.com',
      path: '/users',
      method: 'GET',
      queryParameters: <String, dynamic>{'page': 1},
      headers: <String, dynamic>{
        'Authorization': 'Bearer secret',
        'Accept': 'application/json',
      },
    );

    final response = Response<Map<String, Object?>>(
      requestOptions: requestOptions,
      statusCode: 200,
      headers: Headers.fromMap(<String, List<String>>{
        'content-type': <String>['application/json'],
      }),
      data: <String, Object?>{'ok': true},
    );

    final record = DioRecordBuilder().fromResponse(
      response,
      config: const FlutterChuckerConfig(sessionId: 'test-session'),
    );

    expect(record.method, 'GET');
    expect(record.url, 'https://api.example.com/users?page=1');
    expect(record.statusCode, 200);
    expect(record.requestHeaders['Authorization'], '*****');
    expect(record.requestHeaders['Accept'], 'application/json');
    expect(record.responseBody, '{"ok":true}');
    expect(record.queryParameters['page'], 1);
  });

  test('cURL exporter includes headers and JSON body', () {
    final record = _record(
      method: 'POST',
      path: '/login',
      statusCode: 201,
      requestBody: '{"email":"dev@example.com"}',
      requestHeaders: <String, Object?>{
        'Content-Type': 'application/json',
        'Authorization': '*****',
      },
    );

    final curl = const ChuckerCurlExporter().generate(record);

    expect(
      curl,
      contains("curl --request POST 'https://api.example.com/login'"),
    );
    expect(curl, contains("--header 'Content-Type: application/json'"));
    expect(curl, contains("--header 'Authorization: *****'"));
    expect(curl, contains("--data-raw '{\"email\":\"dev@example.com\"}'"));
  });

  test(
    'in-memory repository filters requests and enforces retention limit',
    () async {
      final repository = InMemoryChuckerLogRepository();

      await repository.save(
        _record(method: 'GET', path: '/users', statusCode: 200),
      );
      await repository.save(
        _record(method: 'POST', path: '/login', statusCode: 401),
      );
      await repository.save(
        _record(
          method: 'DELETE',
          path: '/users/1',
          statusCode: 500,
          durationMs: 900,
        ),
      );

      final postRequests = await repository.getRequests(
        query: const ChuckerLogQuery(method: ChuckerHttpMethodFilter.post),
      );
      expect(postRequests, hasLength(1));
      expect(postRequests.first.path, '/login');

      final errors = await repository.getRequests(
        query: const ChuckerLogQuery(errorsOnly: true),
      );
      expect(errors, hasLength(2));

      final slow = await repository.getRequests(
        query: const ChuckerLogQuery(
          performance: ChuckerPerformanceFilter.slow,
        ),
      );
      expect(slow.single.path, '/users/1');

      await repository.enforceLimit(2);
      expect(await repository.count(), 2);
    },
  );

  test('JSON exporter produces a session payload', () async {
    final repository = InMemoryChuckerLogRepository();
    await repository.save(
      _record(method: 'GET', path: '/users', statusCode: 200),
    );

    final json = await ChuckerJsonExporter(
      repository,
    ).exportJson(sessionId: 'session-a');
    final decoded = jsonDecode(json) as Map<String, dynamic>;

    expect(decoded['sessionId'], 'session-a');
    expect(decoded['requestCount'], 1);
    expect(decoded['requests'], isA<List<dynamic>>());
  });

  testWidgets('ChuckerScreen renders captured requests', (tester) async {
    final repository = InMemoryChuckerLogRepository();
    await repository.save(
      _record(method: 'GET', path: '/users', statusCode: 200),
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: ChuckerScreen(repository: repository),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Network Logs'), findsOneWidget);
    expect(find.text('GET'), findsWidgets);
    expect(find.text('/users'), findsOneWidget);
    expect(find.text('200'), findsOneWidget);
  });

  testWidgets('overlay can reattach after root app is recreated', (
    tester,
  ) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    final repository = InMemoryChuckerLogRepository();
    final captureService = ChuckerCaptureService(
      repository: repository,
      config: const FlutterChuckerConfig(sessionId: 'test-session'),
    );
    final controller = ChuckerOverlayController();

    await tester.pumpWidget(
      MaterialApp(
        key: const ValueKey<String>('en'),
        navigatorKey: navigatorKey,
        home: const SizedBox.shrink(),
      ),
    );
    await controller.show(
      navigatorKey: navigatorKey,
      repository: repository,
      captureService: captureService,
      onOpenLogs: () async {},
      onClearLogs: () async {},
    );
    await tester.pump();
    expect(find.byType(ChuckerOverlayButton), findsOneWidget);

    await tester.pumpWidget(
      MaterialApp(
        key: const ValueKey<String>('ur'),
        navigatorKey: navigatorKey,
        home: const SizedBox.shrink(),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.byType(ChuckerOverlayButton), findsOneWidget);
  });
}

ChuckerHttpRecord _record({
  required String method,
  required String path,
  required int statusCode,
  int durationMs = 120,
  String? requestBody,
  Map<String, Object?> requestHeaders = const <String, Object?>{},
}) {
  final startedAt = DateTime.utc(2026, 1, 1, 12);
  final endedAt = startedAt.add(Duration(milliseconds: durationMs));
  final url = 'https://api.example.com$path';
  final hasError = statusCode >= 400;

  return ChuckerHttpRecord(
    sessionId: 'test-session',
    source: 'dio',
    method: method,
    url: url,
    host: 'api.example.com',
    path: path,
    searchableText: ChuckerHttpRecord.buildSearchableText(
      method: method,
      url: url,
      host: 'api.example.com',
      path: path,
      statusCode: statusCode,
    ),
    startedAt: startedAt,
    endedAt: endedAt,
    durationMs: durationMs,
    statusCode: statusCode,
    hasError: hasError,
    isCancelled: false,
    isSlow: durationMs >= 700,
    requestSize: requestBody?.length ?? 0,
    responseSize: 13,
    requestHeadersJson: ChuckerHttpRecord.encodeMap(requestHeaders),
    responseHeadersJson: ChuckerHttpRecord.encodeMap(<String, Object?>{
      'content-type': 'application/json',
    }),
    queryParametersJson: ChuckerHttpRecord.encodeMap(<String, Object?>{}),
    requestBody: requestBody,
    responseBody: '{"ok":true}',
    contentType: 'application/json',
  );
}
