import 'package:flutter/material.dart';

class DecoCircle extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;

  const DecoCircle(
      {super.key, required this.size, required this.color, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}
