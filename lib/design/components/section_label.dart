import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_typography.dart';

/// Uppercase section heading (e.g. ACTIVE CONFIGURATION).
class SectionLabel extends StatelessWidget {
  const SectionLabel(
    this.text, {
    super.key,
    this.padding = EdgeInsets.zero,
  });

  final String text;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text.toUpperCase(),
        style: AppTypography.sectionLabel,
      ),
    );
  }
}
