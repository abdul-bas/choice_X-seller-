import 'package:choice_x_seller/screen/product/create_product/widgets/common/product_form.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/mobile_view/brand_panel.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key,required this.isCreate});
  final bool isCreate;
  @override
  Widget build(BuildContext context) {
    final c = Get.find<AddProductController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          const BrandPanelMobile(),
          ProductForm(c: c, isMobile: true,isCreate: isCreate,),
        ],
      ),
    );
  }
}
