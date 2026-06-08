
import 'package:flutter/material.dart';

Widget variantPill(String label, Color color, {required IconData icon}) =>
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color:        color.withValues(alpha:  0.12),
        borderRadius: BorderRadius.circular(6),
        border:       Border.all(color: color.withValues(alpha:  0.3)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 10, color: color),
        const SizedBox(width: 4),
        Text(label,
            style: TextStyle(
              fontSize:      9,
              fontWeight:    FontWeight.w800,
              color:         color,
              letterSpacing: 1,
            )),
      ]),
    );