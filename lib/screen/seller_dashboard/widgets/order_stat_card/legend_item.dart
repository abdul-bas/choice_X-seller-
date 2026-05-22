import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class LegendItem extends StatelessWidget {
  const LegendItem({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,                     
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}