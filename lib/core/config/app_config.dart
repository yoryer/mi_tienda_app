import 'dart:convert';

import 'package:flutter/services.dart';

abstract class AppConfig {
  Future<String> getTmdbApiKey();
  Future<String> getAdamsPayApiKey();
}

class AppConfigImpl implements AppConfig {
  Map<String, dynamic> jsonAppConfig;

  Future<void> _loadConfigFile() async {
    String jsonData = await rootBundle.loadString('assets/config/app_config.json');
    jsonAppConfig = json.decode(jsonData);
  }

  Future<String> getTmdbApiKey() async {
    await _loadConfigFile();
    if (jsonAppConfig != null) {
      return jsonAppConfig['tmdb_api_key'];
    }
    return null;
  }

  Future<String> getAdamsPayApiKey() async {
    await _loadConfigFile();
    if (jsonAppConfig != null) {
      return jsonAppConfig['adams_pay_api_key'];
    }
    return null;
  }
}
