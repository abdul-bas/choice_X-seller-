
import 'package:flutter/material.dart';

class WaveBarsSimple extends StatelessWidget {
  const WaveBarsSimple({
    super.key,
    required this.progress,
    required this.played,
    required this.dim,
    required this.animated,
  });

  final double progress;
  final Color played;
  final Color dim;
  final bool animated;

  static const _heights = [
    0.4, 0.7, 0.5, 0.9, 0.6, 0.8, 0.45, 0.7, 0.55, 0.95,
    0.6, 0.75, 0.5, 0.85, 0.4, 0.9, 0.6, 0.7, 0.5, 0.8,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_heights.length, (i) {
        final frac = (i + 1) / _heights.length;
        final isPlayed = frac <= progress;
        final height = _heights[i] * 50;
        return AnimatedContainer(
          duration: animated
              ? const Duration(milliseconds: 300)
              : Duration.zero,
          margin: const EdgeInsets.symmetric(horizontal: 1),
          width: 4,
          height: height,
          decoration: BoxDecoration(
            color: isPlayed ? played : dim,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}
