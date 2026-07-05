import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_typography.dart';

/// Config A / Config B segmented control from the debug panel.
class SegmentedToggle<T extends Object> extends StatelessWidget {
  const SegmentedToggle({
    required this.options,
    required this.selected,
    required this.onChanged,
    super.key,
    this.accentFor,
  });

  final List<SegmentedToggleOption<T>> options;
  final T selected;
  final ValueChanged<T> onChanged;
  final Color Function(T value)? accentFor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.glassSurface,
        borderRadius: AppRadii.cardLg,
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          for (var i = 0; i < options.length; i++) ...[
            if (i > 0)
              Container(
                width: 1,
                height: 36,
                color: AppColors.glassBorder,
              ),
            Expanded(
              child: _Segment(
                label: options[i].label,
                selected: options[i].value == selected,
                accent: accentFor?.call(options[i].value) ??
                    AppColors.accentAmber,
                onTap: () => onChanged(options[i].value),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class SegmentedToggleOption<T extends Object> {
  const SegmentedToggleOption({
    required this.label,
    required this.value,
  });

  final String label;
  final T value;
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.selected,
    required this.accent,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? accent : Colors.transparent,
      borderRadius: AppRadii.cardLg,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadii.cardLg,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              label,
              style: AppTypography.title.copyWith(
                fontSize: 14,
                color: selected ? AppColors.backgroundTop : AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
