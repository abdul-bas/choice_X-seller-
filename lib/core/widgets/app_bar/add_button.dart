
import 'package:flutter/material.dart';

class AppBarAddBtn extends StatelessWidget {
  final String label;
  final Color accent;
  final VoidCallback onTap;
  final double height;

  const AppBarAddBtn({super.key, 
    required this.label,
    required this.accent,
    required this.onTap,
    this.height = 36,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: accent.withValues(alpha:  0.12),
          borderRadius: BorderRadius.circular(9),
          border:
              Border.all(color: accent.withValues(alpha:  0.35), width: 0.5),
        ),
        alignment: Alignment.center,
        child: Text(label,
            style: TextStyle(
                color: accent,
                fontSize: 12,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
