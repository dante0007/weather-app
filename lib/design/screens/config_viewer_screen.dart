import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/app_background.dart';
import 'package:weather_app/design/components/json_syntax_block.dart';
import 'package:weather_app/design/components/segmented_toggle.dart';
import 'package:weather_app/static/static_config_json.dart';
import 'package:weather_app/static/static_mock_data.dart';
import 'package:weather_app/static/static_scenario.dart';

/// Raw JSON config viewer (designs 12, 13).
class ConfigViewerScreen extends StatefulWidget {
  const ConfigViewerScreen({
    required this.scenario,
    super.key,
  });

  final StaticScenario scenario;

  @override
  State<ConfigViewerScreen> createState() => _ConfigViewerScreenState();
}

class _ConfigViewerScreenState extends State<ConfigViewerScreen> {
  late String _selectedConfigId;

  @override
  void initState() {
    super.initState();
    _selectedConfigId = widget.scenario == StaticScenario.configViewerB
        ? 'config_b'
        : 'config_a';
  }

  @override
  Widget build(BuildContext context) {
    final config = _selectedConfigId == 'config_a'
        ? StaticMockData.configA
        : StaticMockData.configB;
    final json = StaticConfigJson.prettyPrint(config);

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: const Text('Raw Configuration'),
          actions: [
            TextButton.icon(
              onPressed: () async {
                await copyJsonToClipboard(json);
                if (!context.mounted) {
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Copied to clipboard'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: const Icon(Icons.copy, size: 18),
              label: const Text('Copy'),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(AppSpacing.padding),
          children: [
            SegmentedToggle<String>(
              selected: _selectedConfigId,
              onChanged: (value) => setState(() => _selectedConfigId = value),
              accentFor: (value) => value == 'config_a'
                  ? AppColors.accentAmber
                  : AppColors.accentBlue,
              options: const [
                SegmentedToggleOption(label: 'Config A', value: 'config_a'),
                SegmentedToggleOption(label: 'Config B', value: 'config_b'),
              ],
            ),
            const SizedBox(height: AppSpacing.gapSm),
            Text(
              config.description,
              style: AppTypography.caption.copyWith(
                color: _selectedConfigId == 'config_a'
                    ? AppColors.accentAmber
                    : AppColors.accentBlue,
              ),
            ),
            const SizedBox(height: AppSpacing.gap),
            JsonSyntaxBlock(json: json),
          ],
        ),
      ),
    );
  }
}
