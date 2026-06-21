# Architecture

`flutter_chucker_pro` is currently published as one package with clear internal module boundaries. The directories map to future packages without exposing router, notification, analytics, or Firebase dependencies.

## Modules

- `lib/src/core`
  - configuration
  - request data model
  - repository interface
  - Sembast and in-memory repository implementations
  - capture service
  - JSON, cURL, and share utilities
  - timeline event interfaces for future event sources
- `lib/src/dio`
  - Dio interceptor
  - request/response/error conversion
  - payload and header serialization
- `lib/src/ui`
  - `ChuckerScreen`
  - `ChuckerRequestDetailsScreen`
  - formatting widgets/utilities
- `lib/src/overlay`
  - overlay insertion controller
  - draggable floating button
  - persisted overlay coordinates

## Data Flow

1. `ChuckerInterceptor` observes Dio requests.
2. It builds a `ChuckerHttpRecord` from success or error data.
3. `ChuckerCaptureService` checks enabled/paused state and saves asynchronously.
4. `ChuckerLogRepository` persists data and enforces `maxStoredRequests`.
5. `ChuckerScreen` queries pages and listens to stats.
6. `ChuckerRequestDetailsScreen` presents payloads, headers, timeline, and cURL.

## Extension Points

Future modules should implement `ChuckerEventSource` and emit `ChuckerTimelineEvent` objects. This allows BLoC, navigation, crash, notification, or custom app events to appear in a unified timeline without changing the network capture API.

Planned module names:

- `flutter_chucker_bloc`
- `flutter_chucker_navigation`
- `flutter_chucker_notifications`
- `flutter_chucker_crashlytics`
