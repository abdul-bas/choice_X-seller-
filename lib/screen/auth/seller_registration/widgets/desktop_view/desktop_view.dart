
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/constants/seller_registration_steps.dart';
import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:choice_x_seller/screen/auth/common/glow_circle.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/form_area.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/desktop_view/security_note.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/desktop_view/sidebar_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 292,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.sellerSurface,          
                  AppColors.sellerSurfaceDeep,        
                  AppColors.sellerSurface,
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -60, left: -50,
                  child: glowCircle(200, AppColors.brand, 0.09),
                ),
                Positioned(
                  top: 260, left: 120,
                  child: glowCircle(150, AppColors.brand, 0.09), 
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 50, 32, 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 46),
                      ShaderMask(
                        shaderCallback: (r) => LinearGradient(
                          colors: [
                            AppColors.sellerHeading,   
                            AppColors.brand,           
                            AppColors.brand,            
                          ],
                          stops: const [0.0, 0.55, 1.0],
                        ).createShader(r),
                        child: const Text(
                          'Seller\nPortal',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,     
                            height: 1.08,
                            letterSpacing: -1.4,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Complete all steps to activate\nyour seller account.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.sellerSubtitle, 
                          height: 1.75,
                        ),
                      ),
                      const SizedBox(height: 44),
                      GetBuilder<SellerRegCtrl>(
                        builder: (c) => Column(
                          children: List.generate(
                            sellerRegistrationSteps.length,
                            (i) => SidebarTile(
                              step: sellerRegistrationSteps[i],
                              index: i,
                              isDone: i < c.step,
                              isActive: i == c.step,
                              isLast: i == sellerRegistrationSteps.length - 1,
                              onTap: () => c.goTo(i),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const SecurityNote(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(flex: 2, child: FormArea(isTablet: false)),
      ],
    );
  }
}