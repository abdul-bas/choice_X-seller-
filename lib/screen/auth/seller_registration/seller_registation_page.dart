import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:choice_x_seller/screen/auth/listeners/auth_gate.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/form_area.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/desktop_view/desktop_view.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/mobile_view/mobile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';


class SellerRegistrationPage extends StatelessWidget {
  const SellerRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SellerRegCtrl());
    return authGate(
      child: Scaffold(
        backgroundColor: AppColors.sellerBg,            
        body: Form(
          key: c.formKey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.maxWidth;
              if (maxWidth >= 1024) return const DesktopLayout();
              return Column(
                children: [
                  const SellerRegistrationMobileHeader(),
                  Expanded(child: FormArea(isTablet: maxWidth >= 680)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}