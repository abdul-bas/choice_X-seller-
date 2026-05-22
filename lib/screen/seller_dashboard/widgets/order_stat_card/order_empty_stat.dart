import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OrderStatusEmptyState extends StatelessWidget {
  const OrderStatusEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,             
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.06),
          width: 0.5,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.sellerBg,              
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.pie_chart_outline_rounded,
                size: 28,
                color: AppColors.white.withValues(alpha: 0.15),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'No order data yet',
              style: TextStyle(
                color: AppColors.white.withValues(alpha: 0.4),
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Data will appear once orders are placed',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white.withValues(alpha: 0.18),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}