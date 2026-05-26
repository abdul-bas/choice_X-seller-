import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/constants/seller_registration_steps.dart';
import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:choice_x_seller/screen/auth/common/glow_circle.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/grid_painter.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/mobile_view/step_badge.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


class SellerRegistrationMobileHeader extends StatelessWidget {
  const SellerRegistrationMobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sellerSurface,              
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: GridPainter())),
          Positioned(
            top: -60, right: -40,
            child: glowCircle(220, AppColors.brand, 0.15),
          ),
          Positioned(
            bottom: -40, left: -30,
            child: glowCircle(160, AppColors.brand, 0.13), 
          ),
          GetBuilder<SellerRegCtrl>(
            builder: (c) => SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sellerRegistrationSteps[c.step].tag,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              color: AppColors.sellerWhite70,
                              letterSpacing: 2.0,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            sellerRegistrationSteps[c.step].title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: AppColors.sellerHeading, 
                              letterSpacing: -0.6,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            sellerRegistrationSteps[c.step].subtitle,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.sellerSubtitle, 
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}