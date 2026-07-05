import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_bloc.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_event.dart';
import 'package:weather_app/features/remote_config/application/bloc/remote_config_state.dart';
import 'package:weather_app/features/remote_config/domain/entities/feature_flag.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';
import 'package:weather_app/features/remote_config/domain/entities/rollout_rule.dart';
import 'package:weather_app/features/remote_config/domain/services/flag_evaluator.dart';
import 'package:weather_app/features/remote_config/presentation/widgets/feature_gate.dart';

class MockRemoteConfigBloc
    extends MockBloc<RemoteConfigEvent, RemoteConfigState>
    implements RemoteConfigBloc {}

void main() {
  const evaluator = FlagEvaluator();
  const flagKey = 'test_flag';

  late MockRemoteConfigBloc mockBloc;

  RemoteConfigState stateWithFlag({required bool enabled}) {
    return RemoteConfigState(
      config: RemoteConfig(
        configId: 'test',
        description: 'test',
        flags: {
          flagKey: FeatureFlag(
            key: flagKey,
            enabled: enabled,
            killSwitch: false,
            rollout: RolloutRule(
              rolloutPercentage: enabled ? 100 : 0,
            ),
          ),
        },
      ),
      evaluator: evaluator,
    );
  }

  Widget buildTestHarness({
    required RemoteConfigState state,
    WidgetBuilder? fallback,
    bool showDebugBadge = false,
  }) {
    when(() => mockBloc.state).thenReturn(state);
    when(() => mockBloc.stream).thenAnswer((_) => Stream<RemoteConfigState>.value(state));

    return MaterialApp(
      home: BlocProvider<RemoteConfigBloc>.value(
        value: mockBloc,
        child: FeatureGate(
          flagKey: flagKey,
          showDebugBadge: showDebugBadge,
          builder: (_) => const Text('gated-child'),
          fallback: fallback,
        ),
      ),
    );
  }

  setUp(() {
    mockBloc = MockRemoteConfigBloc();
  });

  group('FeatureGate', () {
    testWidgets('renders child when flag is on', (tester) async {
      await tester.pumpWidget(
        buildTestHarness(state: stateWithFlag(enabled: true)),
      );

      expect(find.text('gated-child'), findsOneWidget);
      expect(find.text('fallback-child'), findsNothing);
    });

    testWidgets('hides child and renders fallback when flag is off', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestHarness(
          state: stateWithFlag(enabled: false),
          fallback: (_) => const Text('fallback-child'),
        ),
      );

      expect(find.text('gated-child'), findsNothing);
      expect(find.text('fallback-child'), findsOneWidget);
    });

    testWidgets('hides child when flag is off and no fallback provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestHarness(state: stateWithFlag(enabled: false)),
      );

      expect(find.text('gated-child'), findsNothing);
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('shows debug badge when enabled and showDebugBadge is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestHarness(
          state: stateWithFlag(enabled: true),
          showDebugBadge: true,
        ),
      );

      expect(find.text('gated-child'), findsOneWidget);
      expect(find.text(flagKey), findsOneWidget);
    });
  });
}
