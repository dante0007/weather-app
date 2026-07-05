import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';

void main() {
  group('RemoteConfig', () {
    test('flagFor returns a disabled flag for an unknown key', () {
      const config = RemoteConfig(
        configId: 'config-a',
        description: 'Test config',
        flags: {},
      );

      final flag = config.flagFor('unknown_feature');

      expect(flag.key, 'unknown_feature');
      expect(flag.enabled, isFalse);
      expect(flag.killSwitch, isFalse);
      expect(flag.rollout.rolloutPercentage, 0);
    });
  });
}
