
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/account_form.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/address_form.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/basic_form.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/nav_bar.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/step_wrapper.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/desktop_view/desktop_form_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class FormArea extends StatelessWidget {
  const FormArea({super.key, required this.isTablet});

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    return Container(
      color: AppColors.sellerSurface,                   
      child: Column(
        children: [
          if (isDesktop) const DesktopFormHeader(),
          Expanded(
            child: GetBuilder<SellerRegCtrl>(
              builder: (c) => PageView(
                controller: c.page,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  StepWrapper(isTablet: isTablet, child: const BasicForm()),
                  StepWrapper(isTablet: isTablet, child: const AddressForm()),
                  StepWrapper(isTablet: isTablet, child: const AccountForm()),
                ],
              ),
            ),
          ),
          SellerRegistrationNavBar(isTablet: isTablet),
        ],
      ),
    );
  }
}