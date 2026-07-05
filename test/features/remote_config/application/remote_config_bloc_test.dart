import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_event.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_state.dart';
import 'package:weather_app/features/remote_config/domain/entities/feature_flag.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';
import 'package:weather_app/features/remote_config/domain/entities/rollout_rule.dart';
import 'package:weather_app/features/remote_config/domain/repositories/remote_config_repository.dart';
import 'package:weather_app/features/remote_config/domain/services/flag_evaluator.dart';
import 'package:weather_app/features/remote_config/domain/usecases/get_remote_config.dart';
import 'package:weather_app/features/remote_config/domain/usecases/switch_config.dart';
import 'package:weather_app/features/remote_config/domain/usecases/toggle_kill_switch.dart';

class MockGetRemoteConfig extends Mock implements GetRemoteConfig {}

class MockSwitchConfig extends Mock implements SwitchConfig {}

class MockToggleKillSwitch extends Mock implements ToggleKillSwitch {}

class MockRemoteConfigRepository extends Mock implements RemoteConfigRepository {}

FeatureFlag _flag(
  String key, {
  bool enabled = true,
  bool killSwitch = false,
  int rolloutPercentage = 100,
  String? variant,
}) {
  return FeatureFlag(
    key: key,
    enabled: enabled,
    killSwitch: killSwitch,
    rollout: RolloutRule(
      rolloutPercentage: rolloutPercentage,
      variant: variant,
    ),
  );
}

final RemoteConfig configA = RemoteConfig(
  configId: 'config_a',
  description: 'Conservative rollout',
  flags: {
    'uv_index_card': _flag('uv_index_card'),
    'air_quality_card': _flag('air_quality_card', rolloutPercentage: 30),
    'hourly_forecast': _flag('hourly_forecast', rolloutPercentage: 50),
    'wind_speed_card': _flag('wind_speed_card', rolloutPercentage: 0),
    'severe_weather_alert': _flag(
      'severe_weather_alert',
      killSwitch: true,
    ),
    'layout_variant': _flag(
      'layout_variant',
      variant: 'compact',
    ),
  },
);

final RemoteConfig configB = RemoteConfig(
  configId: 'config_b',
  description: 'Full features',
  flags: {
    'uv_index_card': _flag('uv_index_card'),
    'air_quality_card': _flag('air_quality_card'),
    'hourly_forecast': _flag('hourly_forecast'),
    'wind_speed_card': _flag('wind_speed_card', rolloutPercentage: 80),
    'severe_weather_alert': _flag('severe_weather_alert'),
    'layout_variant': _flag('layout_variant', variant: 'detailed'),
  },
);

void main() {
  const evaluator = FlagEvaluator();

  late MockGetRemoteConfig mockGetRemoteConfig;
  late MockSwitchConfig mockSwitchConfig;
  late MockToggleKillSwitch mockToggleKillSwitch;
  late MockRemoteConfigRepository mockRepository;
  late StreamController<RemoteConfig> watchController;

  late String flippingFlagKey;

  setUpAll(() {
    registerFallbackValue(const NoParams());
    registerFallbackValue(const SwitchConfigParams(configId: 'config_a'));
    registerFallbackValue(
      const ToggleKillSwitchParams(flagKey: 'uv_index_card', killed: true),
    );

    for (final entry in configA.flags.entries) {
      final forUser42 = evaluator.evaluate(entry.value, 'user_42').result;
      final forUser87 = evaluator.evaluate(entry.value, 'user_87').result;
      if (forUser42 != forUser87) {
        flippingFlagKey = entry.key;
        return;
      }
    }

    fail('expected a flag to flip between user_42 and user_87 on config_a');
  });

  setUp(() {
    mockGetRemoteConfig = MockGetRemoteConfig();
    mockSwitchConfig = MockSwitchConfig();
    mockToggleKillSwitch = MockToggleKillSwitch();
    mockRepository = MockRemoteConfigRepository();
    watchController = StreamController<RemoteConfig>.broadcast();

    when(() => mockRepository.watchConfig())
        .thenAnswer((_) => watchController.stream);
  });

  tearDown(() async {
    await watchController.close();
  });

  RemoteConfigBloc buildBloc() {
    return RemoteConfigBloc(
      repository: mockRepository,
      getRemoteConfig: mockGetRemoteConfig,
      switchConfig: mockSwitchConfig,
      toggleKillSwitch: mockToggleKillSwitch,
      flagEvaluator: evaluator,
    );
  }

  group('RemoteConfigBloc', () {
    blocTest<RemoteConfigBloc, RemoteConfigState>(
      'started emits loading then loaded with config_a',
      build: () {
        when(() => mockGetRemoteConfig(any()))
            .thenAnswer((_) async => Right(configA));
        return buildBloc();
      },
      act: (bloc) => bloc.add(const RemoteConfigEvent.started()),
      expect: () => [
        predicate<RemoteConfigState>(
          (state) => state.isLoading && state.config == null,
        ),
        predicate<RemoteConfigState>(
          (state) =>
              !state.isLoading &&
              state.config?.configId == 'config_a' &&
              state.failure == null,
        ),
      ],
    );

    blocTest<RemoteConfigBloc, RemoteConfigState>(
      "configSwitched('config_b') results in state holding config_b",
      build: () {
        when(() => mockGetRemoteConfig(any()))
            .thenAnswer((_) async => Right(configA));
        when(() => mockSwitchConfig(any())).thenAnswer((_) async {
          watchController.add(configB);
          return const Right(unit);
        });
        return buildBloc();
      },
      act: (bloc) async {
        bloc.add(const RemoteConfigEvent.started());
        await bloc.stream.firstWhere(
          (state) => state.config?.configId == 'config_a',
        );
        bloc.add(const RemoteConfigEvent.configSwitched('config_b'));
        await bloc.stream.firstWhere(
          (state) => state.config?.configId == 'config_b',
        );
      },
      verify: (bloc) {
        expect(bloc.state.config?.configId, 'config_b');
        expect(bloc.state.isLoading, isFalse);
      },
    );

    blocTest<RemoteConfigBloc, RemoteConfigState>(
      "userIdChanged('user_87') recomputes evaluations",
      build: buildBloc,
      seed: () => RemoteConfigState(
        config: configA,
        userId: 'user_42',
        evaluator: evaluator,
      ),
      act: (bloc) => bloc.add(const RemoteConfigEvent.userIdChanged('user_87')),
      verify: (bloc) {
        final flag = configA.flags[flippingFlagKey]!;
        final enabledForUser42 = evaluator.evaluate(flag, 'user_42').result;
        final enabledForUser87 = bloc.state.isEnabled(flippingFlagKey);

        expect(enabledForUser42, isNot(enabledForUser87));
        expect(bloc.state.evaluations[flippingFlagKey]?.result, enabledForUser87);
      },
    );

    blocTest<RemoteConfigBloc, RemoteConfigState>(
      "killSwitchToggled('uv_index_card', true) makes that flag evaluate false",
      build: () {
        when(() => mockGetRemoteConfig(any()))
            .thenAnswer((_) async => Right(configA));
        when(() => mockToggleKillSwitch(any())).thenAnswer((_) async {
          watchController.add(
            configA.copyWith(
              flags: {
                ...configA.flags,
                'uv_index_card': configA.flags['uv_index_card']!
                    .copyWith(killSwitch: true),
              },
            ),
          );
          return const Right(unit);
        });
        return buildBloc();
      },
      act: (bloc) async {
        bloc.add(const RemoteConfigEvent.started());
        await bloc.stream.firstWhere(
          (state) => state.isEnabled('uv_index_card'),
        );

        bloc.add(
          const RemoteConfigEvent.killSwitchToggled('uv_index_card', true),
        );
        await bloc.stream.firstWhere(
          (state) => !state.isEnabled('uv_index_card'),
        );
      },
      verify: (bloc) {
        expect(bloc.state.isEnabled('uv_index_card'), isFalse);
        expect(
          bloc.state.evaluations['uv_index_card']?.reason.toLowerCase(),
          contains('kill'),
        );
      },
    );
  });
}
