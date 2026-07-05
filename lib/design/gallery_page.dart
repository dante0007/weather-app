import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/app_background.dart';
import 'package:weather_app/design/components/glass_card.dart';
import 'package:weather_app/design/components/kill_switch_indicator.dart';
import 'package:weather_app/design/components/on_off_badge.dart';
import 'package:weather_app/design/components/section_label.dart';
import 'package:weather_app/design/components/segmented_toggle.dart';
import 'package:weather_app/design/components/stat_pill.dart';
import 'package:weather_app/design/components/weather_icon.dart';
import 'package:weather_app/features/weather/domain/entities/weather_condition.dart';
import 'package:weather_app/static/static_mock_data.dart';

/// Temporary component gallery for eyeballing design fidelity.
///
/// Reachable only via the debug route `/design-gallery`.
class DesignGalleryPage extends StatefulWidget {
  const DesignGalleryPage({super.key});

  @override
  State<DesignGalleryPage> createState() => _DesignGalleryPageState();
}

class _DesignGalleryPageState extends State<DesignGalleryPage> {
  String _selectedConfig = 'config_a';

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Design Gallery'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(AppSpacing.padding),
          children: [
            const SectionLabel('Typography'),
            const SizedBox(height: AppSpacing.gap),
            const Text('28°', style: AppTypography.hero),
            const Text('28°', style: AppTypography.temp),
            const Text('UV Index', style: AppTypography.title),
            const Text('Mostly Sunny', style: AppTypography.subtitle),
            const Text('PRECIP', style: AppTypography.caption),
            const SizedBox(height: AppSpacing.gapLg),
            const SectionLabel('Glass Card'),
            const SizedBox(height: AppSpacing.gap),
            const GlassCard(
              child: Text('Frosted glass container', style: AppTypography.subtitle),
            ),
            const SizedBox(height: AppSpacing.gapLg),
            const SectionLabel('Stat Pills'),
            const SizedBox(height: AppSpacing.gap),
            Row(
              children: const [
                Expanded(
                  child: StatPill(
                    icon: Icons.grain,
                    value: '30%',
                    label: 'Precip',
                  ),
                ),
                SizedBox(width: AppSpacing.gap),
                Expanded(
                  child: StatPill(
                    icon: Icons.water_drop_outlined,
                    value: '20%',
                    label: 'Humidity',
                  ),
                ),
                SizedBox(width: AppSpacing.gap),
                Expanded(
                  child: StatPill(
                    icon: Icons.air,
                    value: '9km/h',
                    label: 'Wind',
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.gapLg),
            const SectionLabel('Weather Icons'),
            const SizedBox(height: AppSpacing.gap),
            SizedBox(
              height: 88,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  WeatherIcon(condition: StaticMockData.newYorkBundle.current.condition),
                  const SizedBox(width: AppSpacing.gap),
                  const WeatherIcon(
                    condition: WeatherCondition(
                      type: WeatherConditionType.clear,
                      label: 'Sunny',
                      iconKey: 'clear',
                    ),
                  ),
                  const SizedBox(width: AppSpacing.gap),
                  const WeatherIcon(
                    condition: WeatherCondition(
                      type: WeatherConditionType.rain,
                      label: 'Rainy',
                      iconKey: 'rain',
                    ),
                  ),
                  const SizedBox(width: AppSpacing.gap),
                  const WeatherIcon(
                    condition: WeatherCondition(
                      type: WeatherConditionType.snow,
                      label: 'Snowy',
                      iconKey: 'snow',
                    ),
                  ),
                  const SizedBox(width: AppSpacing.gap),
                  const WeatherIcon(
                    condition: WeatherCondition(
                      type: WeatherConditionType.thunderstorm,
                      label: 'Storm',
                      iconKey: 'thunderstorm',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.gapLg),
            const SectionLabel('On / Off Badges'),
            const SizedBox(height: AppSpacing.gap),
            const Wrap(
              spacing: AppSpacing.gap,
              children: [
                OnOffBadge(isOn: true),
                OnOffBadge(isOn: false),
              ],
            ),
            const SizedBox(height: AppSpacing.gapLg),
            const SectionLabel('Kill Switch Indicator'),
            const SizedBox(height: AppSpacing.gap),
            const Row(
              children: [
                KillSwitchIndicator(isKilled: false),
                SizedBox(width: AppSpacing.gap),
                Text('active', style: AppTypography.subtitle),
                SizedBox(width: AppSpacing.gapLg),
                KillSwitchIndicator(isKilled: true),
                SizedBox(width: AppSpacing.gap),
                Text('killed', style: AppTypography.subtitle),
              ],
            ),
            const SizedBox(height: AppSpacing.gapLg),
            const SectionLabel('Segmented Toggle'),
            const SizedBox(height: AppSpacing.gap),
            SegmentedToggle<String>(
              selected: _selectedConfig,
              onChanged: (value) => setState(() => _selectedConfig = value),
              accentFor: (value) =>
                  value == 'config_a' ? AppColors.accentAmber : AppColors.accentBlue,
              options: const [
                SegmentedToggleOption(label: 'Config A', value: 'config_a'),
                SegmentedToggleOption(label: 'Config B', value: 'config_b'),
              ],
            ),
            const SizedBox(height: AppSpacing.gapLg),
            const SectionLabel('App Background'),
            const SizedBox(height: AppSpacing.gap),
            const Text(
              'This page is wrapped in AppBackground (gradient + glow).',
              style: AppTypography.subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
