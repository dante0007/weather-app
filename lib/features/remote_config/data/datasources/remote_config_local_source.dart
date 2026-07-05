import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/features/remote_config/data/models/remote_config_dto.dart';

class RemoteConfigLocalSource {
  const RemoteConfigLocalSource();

  Future<RemoteConfigDto> loadConfig(String configId) async {
    final path = 'assets/config/$configId.json';

    try {
      final jsonString = await rootBundle.loadString(path);
      final json = jsonDecode(jsonString);

      if (json is! Map<String, dynamic>) {
        throw ConfigParseException('Expected JSON object at $path');
      }

      return RemoteConfigDto.fromJson(json);
    } on ConfigParseException {
      rethrow;
    } on FormatException catch (error) {
      throw ConfigParseException(error.message);
    } catch (error) {
      throw ConfigParseException('Failed to load $path: $error');
    }
  }
}
