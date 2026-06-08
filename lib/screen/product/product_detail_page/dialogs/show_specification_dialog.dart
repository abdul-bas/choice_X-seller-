
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/screen/product/product_detail_page/widgets/specification_details_sheet.dart';
import 'package:flutter/material.dart';

void showSpecificationsSheet(BuildContext context, ProductModel product) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.sellerBg,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: SpecificationDetailsSheet(
              product: product,
              scrollController: controller,
            ),
          );
        },
      );
    },
  );
}