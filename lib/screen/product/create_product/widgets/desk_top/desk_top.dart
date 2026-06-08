
import 'package:choice_x_seller/screen/product/create_product/widgets/common/product_form.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/desk_top/brand_panel.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, required this.isMobile,required this.isCreate});
  final bool isMobile;
  final bool isCreate;
  @override
  Widget build(BuildContext context) {
    final c = Get.find<AddProductController>();
    return Center(
      child: Container(
        margin: const EdgeInsets.all(32),
        constraints: const BoxConstraints(maxWidth: 1100, maxHeight: 700),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black12, width: 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Row(
            children: [
             
              const SizedBox(
                width: 320,height: double.infinity,
                child: BrandPanel(),
              ),
             
              Expanded(
                child: ProductForm(c: c, isMobile: isMobile,isCreate:isCreate ,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}