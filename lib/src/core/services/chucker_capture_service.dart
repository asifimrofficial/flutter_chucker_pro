import 'package:flutter/foundation.dart';

import '../config/flutter_chucker_config.dart';
import '../models/chucker_http_record.dart';
import '../repository/chucker_log_repository.dart';

class ChuckerCaptureService extends ChangeNotifier {
  ChuckerCaptureService({
    required ChuckerLogRepository repository,
    required FlutterChuckerConfig config,
  }) : _repository = repository,
       _config = config;

  final ChuckerLogRepository _repository;
  FlutterChuckerConfig _config;
  bool _paused = false;

  ChuckerLogRepository get repository => _repository;
  FlutterChuckerConfig get config => _config;
  bool get isPaused => _paused;
  bool get isCapturing => _config.enabled && !_paused;

  void updateConfig(FlutterChuckerConfig config) {
    _config = config;
    notifyListeners();
  }

  void pause() {
    if (_paused) {
      return;
    }
    _paused = true;
    notifyListeners();
  }

  void resume() {
    if (!_paused) {
      return;
    }
    _paused = false;
    notifyListeners();
  }

  Future<void> clear() => _repository.clear();

  Future<void> capture(ChuckerHttpRecord record) async {
    if (!isCapturing) {
      return;
    }
    await _repository.save(record);
    await _repository.enforceLimit(_config.maxStoredRequests);
  }
}
