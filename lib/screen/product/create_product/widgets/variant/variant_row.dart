
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/variant_model/variant_model.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/variant/variant_card.dart';
import 'package:choice_x_seller/screen/variant/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';

Widget variantRow(BuildContext context) => Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.sellerBorder, width: 1.2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 18, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Product Variants',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.sellerHeading,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Sizes, colors, storage — add them all',
                      style: TextStyle(
                        fontSize: 11.5,
                        color: AppColors.sellerSubtitle,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () async {
                    final result = await showDialog(
                      context: context,
                      barrierColor: AppColors.black87,
                      builder: (_) => VariantScreen(),
                    );
                    if (result != null) {
                      Get.find<AddProductController>()
                          .setVariant(result);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.sellerHeading,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add_rounded,
                            size: 16, color: AppColors.black),
                        SizedBox(width: 6),
                        Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        GetBuilder<AddProductController>(
          builder: (controller) => Wrap(
            spacing: 8,
            runSpacing: 8,
            children: controller.variants.asMap().entries.map((e) {
              final variant = VariantModel.fromMap(e.value);
              return VariantCard(
                variant: variant,
                controller: controller,
                index: e.key,
              );
            }).toList(),
          ),
        ),
      ],
    );