import 'package:flutter/material.dart';

class DeltaRow extends StatelessWidget {
  const DeltaRow({super.key, required this.delta, required this.color});

  final String delta;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.trending_up_rounded, color: color, size: 12),
        const SizedBox(width: 3),
        Text(
          delta,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}