import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/remote_config/data/datasources/remote_config_local_source.dart';
import 'package:weather_app/features/remote_config/data/repositories/remote_config_repository_impl.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late RemoteConfigRepositoryImpl repository;

  setUp(() {
    repository = RemoteConfigRepositoryImpl(const RemoteConfigLocalSource());
    addTearDown(repository.dispose);
  });

  group('RemoteConfigRepositoryImpl', () {
    test('loads config_a and asserts the flag matrix', () async {
      final result = await repository.getConfig();

      expect(result.isRight(), isTrue);
      final config = result.getRight().toNullable()!;

      expect(config.configId, 'config_a');
      expect(config.description, 'Conservative rollout');
      expect(config.flags['severe_weather_alert']?.killSwitch, isTrue);
      expect(
        config.flags['air_quality_card']?.rollout.rolloutPercentage,
        30,
      );
      expect(config.flags['layout_variant']?.rollout.variant, 'compact');
    });

    test(
      'switchConfig to config_b then getConfig reflects Config B values',
      () async {
        await repository.getConfig();

        final switchResult = await repository.switchConfig('config_b');
        expect(switchResult.isRight(), isTrue);

        final configResult = await repository.getConfig();
        expect(configResult.isRight(), isTrue);
        final config = configResult.getRight().toNullable()!;

        expect(config.configId, 'config_b');
        expect(config.description, 'Full features');
        expect(config.flags['severe_weather_alert']?.killSwitch, isFalse);
        expect(
          config.flags['air_quality_card']?.rollout.rolloutPercentage,
          100,
        );
        expect(config.flags['layout_variant']?.rollout.variant, 'detailed');
      },
    );

    test('watchConfig emits a new config when switchConfig is called', () async {
      final expectation = expectLater(
        repository.watchConfig(),
        emits(
          predicate<RemoteConfig>(
            (config) => config.configId == 'config_b',
            'emits config_b after switch',
          ),
        ),
      );

      await repository.switchConfig('config_b');
      await expectation;
    });

    test(
      'setKillSwitch on uv_index_card mutates only that flag and emits',
      () async {
        await repository.getConfig();

        final expectation = expectLater(
          repository.watchConfig(),
          emits(
            predicate<RemoteConfig>(
              (config) => config.flags['uv_index_card']?.killSwitch == true,
              'emits config with uv_index_card kill-switch enabled',
            ),
          ),
        );

        final result = await repository.setKillSwitch('uv_index_card', true);
        expect(result.isRight(), isTrue);

        await expectation;

        final config = (await repository.getConfig()).getRight().toNullable()!;
        expect(config.flags['uv_index_card']?.killSwitch, isTrue);
        expect(config.flags['air_quality_card']?.killSwitch, isFalse);
        expect(config.flags['severe_weather_alert']?.killSwitch, isTrue);
        expect(
          config.flags['air_quality_card']?.rollout.rolloutPercentage,
          30,
        );
        expect(config.flags['layout_variant']?.rollout.variant, 'compact');
      },
    );

    test('bogus config id returns Left(configParseFailure)', () async {
      final result = await repository.switchConfig('bogus_config');

      expect(result.isLeft(), isTrue);
      final failure = result.getLeft().toNullable()!;

      expect(
        failure,
        isA<ConfigParseFailure>(),
      );
    });
  });
}
