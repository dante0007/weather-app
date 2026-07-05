import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/features/remote_config/domain/entities/feature_flag.dart';
import 'package:weather_app/features/remote_config/domain/entities/rollout_rule.dart';
import 'package:weather_app/features/remote_config/domain/services/flag_evaluator.dart';

void main() {
  const evaluator = FlagEvaluator();

  FeatureFlag flag({
    required String key,
    bool enabled = true,
    bool killSwitch = false,
    int rolloutPercentage = 50,
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

  group('FlagEvaluator', () {
    group('determinism', () {
      test('same (userId, flagKey) returns the same bucket across 1000 calls', () {
        const userId = 'user-alpha';
        const flagKey = 'feature_x';

        final expected = evaluator.computeBucket(userId, flagKey);

        for (var i = 0; i < 1000; i++) {
          expect(
            evaluator.computeBucket(userId, flagKey),
            expected,
            reason: 'call $i should match the first bucket',
          );
        }
      });
    });

    group('distribution sanity', () {
      test(
        'across 10,000 synthetic user ids at 50% rollout, '
        'roughly 45–55% are included',
        () {
          const flagKey = 'rollout_feature';
          const userCount = 10000;
          var includedCount = 0;

          for (var i = 0; i < userCount; i++) {
            final evaluation = evaluator.evaluate(
              flag(key: flagKey, rolloutPercentage: 50),
              'synthetic-user-$i',
            );
            if (evaluation.result) {
              includedCount++;
            }
          }

          final inclusionRate = includedCount / userCount;
          expect(
            inclusionRate,
            inInclusiveRange(0.45, 0.55),
            reason: '$includedCount of $userCount users included '
                '(${(inclusionRate * 100).toStringAsFixed(1)}%)',
          );
        },
      );
    });

    group('kill-switch overrides', () {
      test(
        'killSwitch true with enabled true and 100% rollout evaluates to false '
        'with reason mentioning kill',
        () {
          final evaluation = evaluator.evaluate(
            flag(
              key: 'killed_feature',
              enabled: true,
              killSwitch: true,
              rolloutPercentage: 100,
            ),
            'any-user',
          );

          expect(evaluation.result, isFalse);
          expect(evaluation.killSwitch, isTrue);
          expect(evaluation.reason.toLowerCase(), contains('kill'));
        },
      );
    });

    group('disabled overrides rollout', () {
      test('enabled false with 100% rollout evaluates to false', () {
        final evaluation = evaluator.evaluate(
          flag(
            key: 'disabled_feature',
            enabled: false,
            rolloutPercentage: 100,
          ),
          'any-user',
        );

        expect(evaluation.result, isFalse);
        expect(evaluation.enabled, isFalse);
        expect(evaluation.reason, 'flag disabled');
      });
    });

    group('0% rollout', () {
      test('nobody is included across several user ids', () {
        const flagKey = 'zero_rollout';
        final testFlag = flag(key: flagKey, rolloutPercentage: 0);
        const userIds = [
          'user-1',
          'user-2',
          'user-3',
          'mock-user-001',
          'edge-case-user',
        ];

        for (final userId in userIds) {
          final evaluation = evaluator.evaluate(testFlag, userId);
          expect(
            evaluation.result,
            isFalse,
            reason: '$userId should be excluded at 0% rollout',
          );
        }
      });
    });

    group('100% rollout', () {
      test('everybody is included across several user ids', () {
        const flagKey = 'full_rollout';
        final testFlag = flag(key: flagKey, rolloutPercentage: 100);
        const userIds = [
          'user-1',
          'user-2',
          'user-3',
          'mock-user-001',
          'edge-case-user',
        ];

        for (final userId in userIds) {
          final evaluation = evaluator.evaluate(testFlag, userId);
          expect(
            evaluation.result,
            isTrue,
            reason: '$userId should be included at 100% rollout',
          );
        }
      });
    });

    group('boundary', () {
      test(
        'bucket equal to percentage is excluded; bucket+1 percentage includes user',
        () {
          const userId = 'boundary-user';
          const flagKey = 'boundary_feature';

          final bucket = evaluator.computeBucket(userId, flagKey);

          final excluded = evaluator.evaluate(
            flag(key: flagKey, rolloutPercentage: bucket),
            userId,
          );
          expect(excluded.bucket, bucket);
          expect(excluded.result, isFalse);
          expect(excluded.reason, contains('excluded'));

          final included = evaluator.evaluate(
            flag(key: flagKey, rolloutPercentage: bucket + 1),
            userId,
          );
          expect(included.bucket, bucket);
          expect(included.result, isTrue);
          expect(included.reason, contains('included'));
        },
      );
    });

    group('variant carry-through', () {
      test('flag with variant "detailed" returns that variant in evaluation', () {
        final evaluation = evaluator.evaluate(
          flag(
            key: 'variant_feature',
            rolloutPercentage: 100,
            variant: 'detailed',
          ),
          'variant-user',
        );

        expect(evaluation.variant, 'detailed');
      });
    });
  });
}
