import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/brand_logo.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/deco_circle.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/desk_top/features.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/desk_top/hr_rule.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/desk_top/seller_journey.dart';
import 'package:flutter/material.dart';

class BrandPanel extends StatelessWidget {
  const BrandPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.5, 1.0],
          colors: [AppColors.brand, AppColors.brandMid, AppColors.brandLight],
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          const Positioned(
              top: -70,
              right: -60,
              child: DecoCircle(
                  size: 220, color: AppColors.purple, opacity: 0.35)),
          const Positioned(
              bottom: 50,
              left: -70,
              child:
                  DecoCircle(size: 180, color: AppColors.teal, opacity: 0.22)),
          const Positioned(
              bottom: 160,
              right: 30,
              child: DecoCircle(
                  size: 80, color: Color(0xFF06B6D4), opacity: 0.12)),
          Padding(
            padding: const EdgeInsets.all(36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                BrandLogo(),
                SizedBox(height: 28),
                SellerJourney(),
                SizedBox(height: 24),
                HRule(),
                SizedBox(height: 20),
                ExtraFeatures(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
