import 'dart:convert';

import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';

/// Serializes domain [RemoteConfig] to the same JSON shape as the asset files.
abstract final class ConfigJsonFormatter {
  static Map<String, dynamic> toMap(RemoteConfig config) {
    return {
      'configId': config.configId,
      'description': config.description,
      'flags': {
        for (final entry in config.flags.entries)
          entry.key: {
            'enabled': entry.value.enabled,
            'killSwitch': entry.value.killSwitch,
            'rolloutPercentage': entry.value.rollout.rolloutPercentage,
            if (entry.value.rollout.variant != null)
              'variant': entry.value.rollout.variant,
          },
      },
    };
  }

  static String prettyPrint(RemoteConfig config) {
    return const JsonEncoder.withIndent('  ').convert(toMap(config));
  }
}
