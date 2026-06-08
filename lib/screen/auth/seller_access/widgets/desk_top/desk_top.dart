import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/controller/controller.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/seller_portal_badge.dart';
import 'package:choice_x_seller/state/get_x/obscure.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/feature_chip.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/form_body.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/ring.dart';
import 'package:flutter/material.dart';

Widget buildSellerAccessDesktop(
  BuildContext context,
  TextEditingController email0,
  TextEditingController password0,
  GlobalKey<FormState> formKey,
  Obscure obscure,
) {
  return Row(
    children: [
  
      Expanded(
        flex: 5,
        child: Container(
          height: double.infinity,
          decoration:  BoxDecoration(gradient:AuthController. sellerHeroPanelGradient()),
          child: Stack(
            children: [
              Positioned(
                  top: -80, left: -80, child: sellerAccessRing(380, 0.06)),
              Positioned(
                  bottom: -60, right: -60, child: sellerAccessRing(300, 0.04)),
              Positioned(
                  top: 200, right: 50, child: sellerAccessRing(130, 0.05)),
              Padding(
                padding: const EdgeInsets.all(56),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SellerPortalBadge(
                      dotColor: AppColors.sellerPasswordIcon,
                      badgeBg: AppColors.sellerPasswordIcon
                          .withValues(alpha: 0.12),
                      badgeBorder: AppColors.sellerPasswordIcon
                          .withValues(alpha: 0.25),
                      label: 'CHOICEX SELLER PORTAL',
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Manage your\nbusiness from\none place.',
                      style: TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.w900,
                        color: AppColors.white,
                        height: 1.1,
                        letterSpacing: -1.0,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Track orders, manage products,\n'
                      'and grow your store with ChoiceX.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.white.withValues(alpha: 0.38),
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 48),
                     Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        SellerFeatureChip(
                            icon: Icons.inventory_2_outlined,
                            label: 'Products'),
                        SellerFeatureChip(
                            icon: Icons.receipt_long_rounded, label: 'Orders'),
                        SellerFeatureChip(
                            icon: Icons.bar_chart_rounded, label: 'Analytics'),
                        SellerFeatureChip(
                            icon: Icons.assignment_return_rounded,
                            label: 'Returns'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

     
      Expanded(
        flex: 4,
        child: Container(
          height: double.infinity,
          color: AppColors.sellerBg,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(52),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 360),
                child: sellerAccessFormBody(
                    context, email0, password0, formKey, obscure, true),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
