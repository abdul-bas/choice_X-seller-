import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/seller_registration_step_model/step_model.dart';
import 'package:flutter/material.dart';

class SidebarTile extends StatelessWidget {
  const SidebarTile({
    super.key,
    required this.step,
    required this.index,
    required this.isDone,
    required this.isActive,
    required this.isLast,
    required this.onTap,
  });

  final SellerRegistrationStepModel step;
  final int index;
  final bool isDone, isActive, isLast;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDone
                      ? AppColors.doneBg
                      : isActive
                          ? AppColors.activeBg
                          : AppColors.transparent,
                  border: Border.all(
                    color: isDone
                        ? AppColors.doneBorder
                        : isActive
                            ? AppColors.activeBorderColor
                            : AppColors.grey800,
                    width: isActive ? 2 : 1.5,
                  ),
                ),
                child: Center(
                  child: isDone
                      ? Icon(
                          Icons.check_rounded,
                          color: AppColors.sellerAccentGreen,
                          size: 15,
                        )
                      : Text(
                          step.tag,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: isActive
                                ? AppColors.sellerHeading
                                : AppColors.grey800,
                            letterSpacing: 0.5,
                          ),
                        ),
                ),
              ),
              if (!isLast)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 1.5,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: isDone
                          ? [
                              AppColors.sellerAccentGreen
                                  .withValues(alpha: 0.45),
                              AppColors.sellerAccentGreen
                                  .withValues(alpha: 0.08),
                            ]
                          : [AppColors.grey800, AppColors.transparent],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(top: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: isActive
                        ? AppColors.sellerHeading
                        : isDone
                            ? AppColors.doneText
                            : AppColors.grey800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  isActive
                      ? 'In progress'
                      : isDone
                          ? 'Completed'
                          : 'Pending',
                  style: TextStyle(
                    fontSize: 10,
                    color: isActive
                        ? AppColors.sellerWhite10.withValues(alpha: 0.75)
                        : isDone
                            ? AppColors.sellerAccentGreen.withValues(alpha: 0.6)
                            : AppColors.grey800,
                  ),
                ),
                SizedBox(height: isLast ? 0 : 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
