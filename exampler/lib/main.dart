import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chucker_pro/flutter_chucker_pro.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterChucker.initialize(
    navigatorKey: navigatorKey,
    config: const FlutterChuckerConfig(
      maxStoredRequests: 1000,
      maskedHeaders: <String>['Authorization', 'Cookie'],
    ),
  );

  runApp(const ChuckerExamplerApp());
}

class ChuckerExamplerApp extends StatelessWidget {
  const ChuckerExamplerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Chucker Pro Tester',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const TesterHomePage(),
    );
  }
}

class TesterHomePage extends StatefulWidget {
  const TesterHomePage({super.key});

  @override
  State<TesterHomePage> createState() => _TesterHomePageState();
}

class _TesterHomePageState extends State<TesterHomePage> {
  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      headers: <String, Object?>{'Authorization': 'Bearer tester-token'},
    ),
  )..interceptors.add(ChuckerInterceptor());

  bool _loading = false;
  String _lastResult = 'Tap a request button to populate the inspector.';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chucker Tester'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Open logs',
            onPressed: FlutterChucker.show,
            icon: const Icon(Icons.open_in_full_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text(
            'Generate requests',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(_lastResult),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _loading ? null : _loadUsers,
            icon: const Icon(Icons.download_rounded),
            label: const Text('GET /users'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _loading ? null : _createPost,
            icon: const Icon(Icons.upload_rounded),
            label: const Text('POST /posts'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _loading ? null : _loadMissingRoute,
            icon: const Icon(Icons.error_outline_rounded),
            label: const Text('GET /missing-route'),
          ),
          const SizedBox(height: 20),
          if (_loading) const LinearProgressIndicator(),
        ],
      ),
    );
  }

  Future<void> _loadUsers() async {
    await _run(() async {
      final response = await _dio.get<List<dynamic>>('/users');
      return 'Loaded ${response.data?.length ?? 0} users.';
    });
  }

  Future<void> _createPost() async {
    await _run(() async {
      final response = await _dio.post<Map<String, dynamic>>(
        '/posts',
        data: <String, Object?>{
          'title': 'Flutter Chucker Pro',
          'body': 'Captured from the tester app',
          'userId': 1,
        },
      );
      return 'Created post ${response.data?['id']}.';
    });
  }

  Future<void> _loadMissingRoute() async {
    await _run(() async {
      await _dio.get<void>('/missing-route');
      return 'Unexpected success.';
    });
  }

  Future<void> _run(Future<String> Function() action) async {
    setState(() {
      _loading = true;
    });
    try {
      final result = await action();
      setState(() {
        _lastResult = result;
      });
    } on DioException catch (error) {
      setState(() {
        _lastResult = error.message ?? error.type.name;
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }
}
