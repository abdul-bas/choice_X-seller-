
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StepDot extends StatelessWidget {
  final IconData icon;
  const StepDot(this.icon, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.tealLight.withValues(alpha: 0.15),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.tealLight, width: 1.5),
      ),
      child: Icon(icon, size: 15, color: AppColors.tealLight),
    );
  }
}
