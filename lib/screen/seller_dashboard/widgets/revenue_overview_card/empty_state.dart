
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyRevenueState extends StatelessWidget {
  const EmptyRevenueState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(   margin:
                                const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            padding:  const EdgeInsets.all(15),
                            decoration:BoxDecoration(
                                    color: AppColors.sellerSurface,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.sellerSurface,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.sellerBorder, width: 0.5),
                ),
                child: const Icon(
                  Icons.bar_chart_outlined,
                  size: 30,
                  color: AppColors.textSubdued,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'No revenue yet',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Your orders and earnings will appear here once customers start purchasing from your store.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSubdued,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}