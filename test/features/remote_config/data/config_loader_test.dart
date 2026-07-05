import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/core/constants/app_constants.dart';
import 'package:weather_app/features/remote_config/data/datasources/remote_config_local_source.dart';
import 'package:weather_app/features/remote_config/data/mappers/config_mapper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const localSource = RemoteConfigLocalSource();

  group('config assets', () {
    test('config_a loads and maps without error', () async {
      final dto = await localSource.loadConfig('config_a');
      final config = mapRemoteConfigDto(dto);

      expect(config.configId, 'config_a');
      expect(config.description, 'Conservative rollout');
      expect(config.flags['severe_weather_alert']?.killSwitch, isTrue);
      expect(config.flags['layout_variant']?.rollout.variant, 'compact');
      expect(
        config.flags['seven_day_forecast']?.rollout.rolloutPercentage,
        0,
      );
    });

    test('config_b loads and maps without error', () async {
      final dto = await localSource.loadConfig('config_b');
      final config = mapRemoteConfigDto(dto);

      expect(config.configId, 'config_b');
      expect(config.description, 'Full features');
      expect(config.flags['wind_speed_card']?.rollout.rolloutPercentage, 80);
      expect(config.flags['severe_weather_alert']?.killSwitch, isFalse);
      expect(config.flags['layout_variant']?.rollout.variant, 'detailed');
      expect(
        config.flags['seven_day_forecast']?.rollout.rolloutPercentage,
        100,
      );
    });

    test('registered asset paths resolve', () async {
      await rootBundle.loadString(AppConstants.configAPath);
      await rootBundle.loadString(AppConstants.configBPath);
    });
  });
}
