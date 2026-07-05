import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/app_background.dart';
import 'package:weather_app/design/static_screen_builder.dart';
import 'package:weather_app/static/static_scenario.dart';

/// Walkthrough of all 15 design states from `Weather States_compressed.pdf`.
class DesignIndexPage extends StatelessWidget {
  const DesignIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Design States'),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.padding),
          itemCount: StaticScenario.values.length,
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSpacing.gapSm),
          itemBuilder: (context, index) {
            final scenario = StaticScenario.values[index];

            return Material(
              color: Colors.transparent,
              child: ListTile(
                tileColor: Colors.white.withValues(alpha: 0.04),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                title: Text(
                  StaticScreenBuilder.label(scenario),
                  style: AppTypography.subtitle.copyWith(
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => StaticScreenBuilder.build(scenario),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
