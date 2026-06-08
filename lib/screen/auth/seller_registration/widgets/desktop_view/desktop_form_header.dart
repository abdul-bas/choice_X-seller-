
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/constants/seller_registration_steps.dart';
import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


class DesktopFormHeader extends StatelessWidget {
  const DesktopFormHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellerRegCtrl>(
      builder: (c) => Container(
        padding: const EdgeInsets.fromLTRB(52, 38, 52, 28),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sellerRegistrationSteps[c.step].tag,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: AppColors.sellerWhite70,  
                    letterSpacing: 2.5,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  sellerRegistrationSteps[c.step].title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: AppColors.sellerHeading,     
                    letterSpacing: -0.7,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  sellerRegistrationSteps[c.step].subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.white38,         
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: List.generate(
                sellerRegistrationSteps.length,
                (i) {
                  final done   = i < c.step;
                  final active = i == c.step;
                  return GestureDetector(
                    onTap: () => c.goTo(i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 280),
                      width: active ? 32 : 8,
                      height: 8,
                      margin: const EdgeInsets.only(left: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: done
                            ? AppColors.sellerWhite60   
                            : active
                                ? AppColors.brand     
                                : AppColors.sellerStepInactive, 
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}