import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/controller/controller.dart';
import 'package:choice_x_seller/screen/auth/listeners/auth_gate.dart';
import 'package:choice_x_seller/state/get_x/obscure.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/desk_top/desk_top.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/mobile/mobile.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/tab/tab.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SellerAuthPage extends StatelessWidget {
  SellerAuthPage({super.key});

  final Obscure _obscure = Get.put(Obscure());

  @override
  Widget build(BuildContext context) {
    final email0 = TextEditingController();
    final password0 = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return authGate(
      child: Scaffold(
        backgroundColor: AppColors.sellerBg,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            if (w < AuthController.kSellerMobileBreakpoint) {
              return buildSellerAccessMobile(
                  context, email0, password0, formKey, _obscure);
            } else if (w < AuthController.kSellerTabletBreakpoint) {
              return buildSellerAccessTablet(
                  context, email0, password0, formKey, _obscure);
            } else {
              return buildSellerAccessDesktop(
                  context, email0, password0, formKey, _obscure);
            }
          },
        ),
      ),
    );
  }
}
