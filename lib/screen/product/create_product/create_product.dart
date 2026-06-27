import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/mobile_view/mobile_view.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'widgets/desk_top/desk_top.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}
class _CreateProductScreenState extends State<CreateProductScreen> {
  late AddProductController c;

  @override
  void initState() {
    super.initState();

    final c = Get.find<AddProductController>();
    c.clearAll();
  }

  @override
  void dispose() {
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
                  isCreate: true,
                )
              : DesktopLayout(
                  isMobile: false,
                  isCreate: true,
                );
        },
      ),
    );
  }
}
