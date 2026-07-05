import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:weather_app/core/theme/app_radii.dart';
import 'package:weather_app/core/theme/app_spacing.dart';
import 'package:weather_app/core/theme/app_typography.dart';

/// VS Code–dark syntax highlighting for pretty-printed JSON.
class JsonSyntaxBlock extends StatelessWidget {
  const JsonSyntaxBlock({
    required this.json,
    super.key,
  });

  final String json;

  static const Color _background = Color(0xFF1E1E1E);
  static const Color _keyColor = Color(0xFF9CDCFE);
  static const Color _stringColor = Color(0xFFCE9178);
  static const Color _numberColor = Color(0xFFB5CEA8);
  static const Color _boolColor = Color(0xFF569CD6);
  static const Color _nullColor = Color(0xFF569CD6);
  static const Color _punctuationColor = Color(0xFFD4D4D4);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.padding),
      decoration: BoxDecoration(
        color: _background,
        borderRadius: AppRadii.card,
        border: Border.all(color: const Color(0xFF2D2D2D)),
      ),
      child: SelectableText.rich(
        TextSpan(children: _highlight(json)),
        style: AppTypography.caption.copyWith(
          fontFamily: 'monospace',
          fontSize: 12,
          height: 1.5,
          color: _punctuationColor,
        ),
      ),
    );
  }

  static List<TextSpan> _highlight(String source) {
    final spans = <TextSpan>[];
    final pattern = RegExp(
      r'"(?:\\.|[^"\\])*"(\s*:)?|\btrue\b|\bfalse\b|\bnull\b|-?\d+(?:\.\d+)?|[{}\[\],:]',
    );

    var index = 0;
    for (final match in pattern.allMatches(source)) {
      if (match.start > index) {
        spans.add(TextSpan(text: source.substring(index, match.start)));
      }

      final text = match.group(0)!;
      final isKey = match.group(1) != null;

      final color = switch (text) {
        'true' || 'false' => _boolColor,
        'null' => _nullColor,
        '{' || '}' || '[' || ']' || ',' || ':' => _punctuationColor,
        _ when text.startsWith('"') && isKey => _keyColor,
        _ when text.startsWith('"') => _stringColor,
        _ => _numberColor,
      };

      spans.add(TextSpan(text: text, style: TextStyle(color: color)));
      index = match.end;
    }

    if (index < source.length) {
      spans.add(TextSpan(text: source.substring(index)));
    }

    return spans;
  }
}

Future<void> copyJsonToClipboard(String json) {
  return Clipboard.setData(ClipboardData(text: json));
}
