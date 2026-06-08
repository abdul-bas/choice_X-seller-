import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/brand_logo.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/deco_circle.dart';
import 'package:flutter/material.dart';

class BrandPanelMobile extends StatelessWidget {
  const BrandPanelMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.deepPurple,
      padding: const EdgeInsets.fromLTRB(24, 36, 24, 28),
      child: Stack(
        children: [
          Positioned(
            top: -20,
            right: -20,
            child: DecoCircle(size: 120, color: AppColors.purple, opacity: 0.5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandLogo(),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}