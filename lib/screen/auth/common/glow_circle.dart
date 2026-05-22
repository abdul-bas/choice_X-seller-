import 'package:flutter/material.dart';

Widget glowCircle(double size, Color color, double opacity) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
         color:   color.withValues(alpha: opacity),
        ),
      );