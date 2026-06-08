import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/desk_top/desk_top.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/mobile_view/mobile_view.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  @override
  void initState() {
    super.initState();

    final c = Get.find<AddProductController>();
    
    c.initFromProduct(widget.product);
  }

  @override
  void dispose() {
    final c = Get.find<AddProductController>();
    c.clearAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sellerSurfaceDeep,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return isMobile
              ? const MobileLayout(
                  isCreate: false,
                )
              : DesktopLayout(
                  isMobile: false,
                  isCreate: false,
                );
        },
      ),
    );
  }
}
