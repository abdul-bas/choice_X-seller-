
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StepWrapper extends StatelessWidget {
  const StepWrapper({super.key, required this.child, required this.isTablet});

  final Widget child;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final hPad = isTablet ? 40.0 : 22.0;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(hPad, 28, hPad, 12),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.sellerSurface,               
                AppColors.sellerSurfaceDeep,           
                AppColors.sellerSurface,
              ],
            ),
            border: Border.all(color: AppColors.sellerBorder),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: child,
          ),
        ),
      ),
    );
  }
}