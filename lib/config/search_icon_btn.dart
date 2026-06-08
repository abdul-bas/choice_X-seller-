
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
class AppBarSearchIconBtn extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final bool isMobile;

  const AppBarSearchIconBtn({
    super.key,
    required this.isActive,
    required this.onTap,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final double size = isMobile ? 32 : 36;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isActive ? AppColors.white10 : AppColors.white5,
          borderRadius: BorderRadius.circular(isMobile ? 8 : 9),
          border: Border.all(
            color: isActive ? AppColors.white18 : AppColors.white9,
            width: 0.5,
          ),
        ),
        child: Icon(
          isActive ? Icons.search_off_rounded : Icons.search_rounded,
          size:  isMobile ? 16 : 17,
          color: isActive ? AppColors.white70 : AppColors.white45,
        ),
      ),
    );
  }
}