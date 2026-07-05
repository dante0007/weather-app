import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/design/components/app_background.dart';
import 'package:weather_app/design/components/json_syntax_block.dart';
import 'package:weather_app/design/components/segmented_toggle.dart';
import 'package:weather_app/features/remote_config/data/datasources/remote_config_local_source.dart';
import 'package:weather_app/features/remote_config/data/mappers/config_mapper.dart';
import 'package:weather_app/features/remote_config/domain/entities/remote_config.dart';
import 'package:weather_app/static/static_config_json.dart';

class ConfigViewerPage extends StatefulWidget {
  const ConfigViewerPage({super.key});

  @override
  State<ConfigViewerPage> createState() => _ConfigViewerPageState();
}

class _ConfigViewerPageState extends State<ConfigViewerPage> {
  static const _localSource = RemoteConfigLocalSource();

  RemoteConfig? _configA;
  RemoteConfig? _configB;
  String _selectedConfigId = 'config_a';
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadConfigs();
  }

  Future<void> _loadConfigs() async {
    try {
      final configA = mapRemoteConfigDto(
        await _localSource.loadConfig('config_a'),
      );
      final configB = mapRemoteConfigDto(
        await _localSource.loadConfig('config_b'),
      );

      if (!mounted) {
        return;
      }

      setState(() {
        _configA = configA;
        _configB = configB;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _error = '$error';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            if (!_isLoading && _error == null)
              TextButton.icon(
                onPressed: () async {
                  final json = StaticConfigJson.prettyPrint(_activeConfig);
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
        body: _buildBody(),
      ),
    );
  }

  RemoteConfig get _activeConfig =>
      _selectedConfigId == 'config_a' ? _configA! : _configB!;

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: Text(_error!));
    }

    final config = _activeConfig;
    final json = StaticConfigJson.prettyPrint(config);

    return ListView(
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
    );
  }
}
