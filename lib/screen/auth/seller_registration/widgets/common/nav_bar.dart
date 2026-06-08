
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/constants/seller_registration_steps.dart';
import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


class SellerRegistrationNavBar extends StatelessWidget {
  const SellerRegistrationNavBar({super.key, required this.isTablet});

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final hPad = isTablet ? 40.0 : 22.0;
    return GetBuilder<SellerRegCtrl>(
      builder: (c) {
        final isLast = c.step == sellerRegistrationSteps.length - 1;
        return Container(
          padding: EdgeInsets.fromLTRB(hPad, 16, hPad, 34),
          decoration: const BoxDecoration(
            color: AppColors.sellerSurface,            
          ),
          child: Row(
            children: [
              if (c.step > 0)
                GestureDetector(
                  onTap: c.back,
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: AppColors.sellerBg,      
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: AppColors.sellerBorder), 
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          size: 14,
                          color: AppColors.sellerSubtitle,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.sellerWhite70, 
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                const SizedBox(width: 100),

              const Spacer(),

              GetBuilder<SellerRegCtrl>(
                id: 'next_btn',
                builder: (c) => GestureDetector(
                  onTapDown: (_) => c.setNextBtnDown(true),
                  onTapUp: (_) {
                    c.setNextBtnDown(false);
                    c.next();
                    if (isLast) c.registerSeller(context);
                  },
                  onTapCancel: () => c.setNextBtnDown(false),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: AppColors.white,          
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isLast ? 'Create Account' : 'Continue',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.brand, 
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: AppColors.sellerBlack45,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Icon(
                                isLast
                                    ? Icons.check_rounded
                                    : Icons.arrow_forward_rounded,
                                size: 13,
                                color: AppColors.white, 
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}