import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/controller/controller.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/seller_portal_badge.dart';
import 'package:choice_x_seller/state/get_x/obscure.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/form_body.dart';

import 'package:flutter/material.dart';

Widget buildSellerAccessMobile(
  BuildContext context,
  TextEditingController email0,
  TextEditingController password0,
  GlobalKey<FormState> formKey,
  Obscure obscure,
) {
  return SingleChildScrollView(
    child: Column(
      children: [
      
        Container(
          width: double.infinity,
          decoration:  BoxDecoration(
            gradient:AuthController. sellerHeroPanelGradient(),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SellerPortalBadge(
                    dotColor: AppColors.white70,
                    badgeBg: AppColors.white.withValues(alpha: 0.12),
                    badgeBorder: AppColors.white.withValues(alpha: 0.25),
                    label: 'CHOICEX SELLER',
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome\nback.',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                      height: 1.1,
                      letterSpacing: -0.8,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sign in to manage your store',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.white.withValues(alpha: 0.40),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    
        Padding(
          padding: const EdgeInsets.all(15),
          child: sellerAccessFormBody(
              context, email0, password0, formKey, obscure, false),
        ),
      ],
    ),
  );
}