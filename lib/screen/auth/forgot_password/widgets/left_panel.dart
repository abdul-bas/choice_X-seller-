
import 'package:choice_x_seller/screen/auth/controller/controller.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/head_line.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/step_badge.dart';

import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/ring.dart';
import 'package:flutter/material.dart';

class ForgotPasswordLeftPanel extends StatelessWidget {
  const ForgotPasswordLeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(52),
        decoration:  BoxDecoration(gradient:AuthController. forgotPanelGradient()),
        child: Stack(
          children: [
            Positioned(
              top: -60, right: 60,
              child: sellerAccessRing(300, 0.08),
            ),
            Positioned(
              bottom: -40, left: -40,
              child: sellerAccessRing(200, 0.08),
            ),
            Positioned(
              bottom: 160, right: 30,
              child: sellerAccessRing(120, 0.06),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ForgotPasswordBadge(),
                SizedBox(height: 32),
                ForgotPasswordHeadline(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}