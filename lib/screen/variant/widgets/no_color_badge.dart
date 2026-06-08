
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NoColorBadge extends StatelessWidget {
  const NoColorBadge({super.key});

  @override
  Widget build(BuildContext context) => Container(
        key:     const ValueKey('none'),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color:        AppColors.variantSurfaceMid,
          borderRadius: BorderRadius.circular(8),
          border:       Border.all(color: AppColors.variantBorder),
        ),
        child: const Text('Select a color',
            style: TextStyle(fontSize: 11, color: AppColors.variantLabelMuted)),
      );
}