import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/controller/controller.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/seller_portal_badge.dart';
import 'package:choice_x_seller/state/get_x/obscure.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/feature_chip.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/form_body.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/ring.dart';
import 'package:flutter/material.dart';

Widget buildSellerAccessTablet(
  BuildContext context,
  TextEditingController email0,
  TextEditingController password0,
  GlobalKey<FormState> formKey,
  Obscure obscure,
) {
  return Column(
    children: [
 
      Container(
        width: double.infinity,
        decoration:  BoxDecoration(
          gradient: AuthController.sellerHeroPanelGradient(),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 24, 32, 36),
            child: Stack(
              children: [
                Positioned(
                    top: -40, right: -40, child: sellerAccessRing(220, 0.05)),
                Positioned(
                    bottom: -20, left: -20, child: sellerAccessRing(150, 0.04)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SellerPortalBadge(
                      dotColor: AppColors.sellerPasswordIcon,
                      badgeBg: AppColors.sellerPasswordIcon
                          .withValues(alpha: 0.12),
                      badgeBorder: AppColors.sellerPasswordIcon
                          .withValues(alpha: 0.25),
                      label: 'CHOICEX SELLER PORTAL',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Manage your\nbusiness.',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                color: AppColors.white,
                                height: 1.1,
                                letterSpacing: -0.8,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Track orders, manage products\nand grow your store.',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.white.withValues(alpha: 0.38),
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children:  [
                            SellerFeatureChip(
                                icon: Icons.inventory_2_outlined,
                                label: 'Products'),
                            SellerFeatureChip(
                                icon: Icons.receipt_long_rounded,
                                label: 'Orders'),
                            SellerFeatureChip(
                                icon: Icons.bar_chart_rounded,
                                label: 'Analytics'),
                            SellerFeatureChip(
                                icon: Icons.assignment_return_rounded,
                                label: 'Returns'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      
      Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(40, 36, 40, 48),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: sellerAccessFormBody(
                  context, email0, password0, formKey, obscure, true),
            ),
          ),
        ),
      ),
    ],
  );
}