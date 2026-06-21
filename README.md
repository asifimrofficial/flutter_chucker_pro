# flutter_chucker_pro

`flutter_chucker_pro` is an in-app network inspection toolkit for Flutter. It captures Dio traffic, persists requests with a pure-Dart Sembast store, and exposes a draggable floating overlay that opens a Material 3 dashboard inside the running app.

The package is router-agnostic and notification-agnostic. It only needs a `navigatorKey` if you want the built-in overlay to open the dashboard for you.

## Features

- Dio request, response, error, timeout, and cancellation capture
- Draggable floating overlay with edge snapping and persisted position
- Request list with search, filters, sorting, lazy loading, and stats
- Request details tabs for overview, request body, response body, headers, timeline, and cURL
- Header masking for secrets such as `Authorization` and `Cookie`
- JSON session export and platform sharing
- cURL generation for headers, JSON bodies, and multipart form metadata
- Pure-Dart persistence with automatic oldest-request cleanup
- Extension interfaces for future BLoC, navigation, notifications, and crash modules

## Install

```yaml
dependencies:
  flutter_chucker_pro: ^0.0.1
  dio: ^5.9.2
```

## Quick Start

```dart
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterChucker.initialize(
    navigatorKey: navigatorKey,
  );

  runApp(const MyApp());
}
```

```dart
MaterialApp(
  navigatorKey: navigatorKey,
  home: const HomeScreen(),
)
```

```dart
final dio = Dio();
dio.interceptors.add(ChuckerInterceptor());
```

That is enough to show the overlay and capture Dio traffic.

## Configuration

```dart
await FlutterChucker.initialize(
  navigatorKey: navigatorKey,
  config: const FlutterChuckerConfig(
    enabled: true,
    maxStoredRequests: 1000,
    captureRequestBody: true,
    captureResponseBody: true,
    maskedHeaders: [
      'Authorization',
      'Cookie',
    ],
  ),
);
```

## Public API

```dart
FlutterChucker.pause();
FlutterChucker.resume();
await FlutterChucker.clear();
await FlutterChucker.show();
final json = await FlutterChucker.exportJson();
```

The dashboard widget is also exported, so apps using GoRouter, AutoRoute, Beamer, raw Navigator, or a custom shell can present it however they prefer:

```dart
ChuckerScreen()
```

## Example Tester App

The requested tester app lives in `exampler/`:

```sh
cd exampler
flutter pub get
flutter run
```

There is also a conventional pub.dev sample in `example/`.

## Architecture

The package is structured as logical modules under `lib/src`:

- `core`: config, models, repositories, capture services, JSON/cURL/share export
- `dio`: Dio interceptor and request serialization
- `ui`: request list and details screens
- `overlay`: draggable overlay and overlay controller

This keeps the first release simple to install while preserving boundaries for future packages such as `flutter_chucker_bloc`, `flutter_chucker_navigation`, and `flutter_chucker_notifications`.

## Development

Run checks:

```sh
flutter analyze
flutter test
```
