import 'package:flutter/material.dart';

import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_radii.dart';

class ShimmerBox extends StatefulWidget {
  const ShimmerBox({
    super.key,
    this.height = 96,
    this.width,
    this.borderRadius = AppRadii.card,
  });

  final double height;
  final double? width;
  final BorderRadius borderRadius;

  @override
  State<ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<ShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            gradient: LinearGradient(
              begin: Alignment(-1 + _controller.value * 2, 0),
              end: Alignment(_controller.value * 2, 0),
              colors: const [
                Color(0xFF1A1A24),
                Color(0xFF2A2A38),
                Color(0xFF1A1A24),
              ],
              stops: const [0.1, 0.5, 0.9],
            ),
            border: Border.all(color: AppColors.glassBorder),
          ),
        );
      },
    );
  }
}
