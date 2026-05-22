import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/seller_input_field.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/identifiers_and_time_line/added_date.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/identifiers_and_time_line/delivery_days.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/identifiers_and_time_line/naufacture_date.dart';
import 'package:flutter/material.dart';

class ProductTimeLine extends StatelessWidget {
  const ProductTimeLine(
    this.c,
    this.context, {
    super.key,
    required this.isMobile,
  });

  final AddProductController c;
  final BuildContext context;
  final bool isMobile;

  @override
  Widget build(BuildContext ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Tags / Keywords'),
        SellerInputField(
          validator: ProductLogic.validateTags,
          controller: c.cTags,
          hint: 'e.g. smart TV, 4K, LED',
          prefixIcon: Icons.sell_outlined,
        ),
        const SizedBox(height: 16),
        isMobile
            ? Column(
                children: [
                  manufactureDate(context),
                  const SizedBox(height: 16),
                  addedDate(context),
                  const SizedBox(height: 16),
                  deliveryDays(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: manufactureDate(context)),
                  const SizedBox(width: 12),
                  Expanded(child: addedDate(context)),
                  const SizedBox(width: 12),
                  Expanded(child: deliveryDays()),
                ],
              ),
      ],
    );
  }
}
