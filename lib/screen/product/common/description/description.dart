import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/common/input_fields/seller_input_field.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description(this.c, {super.key});
  final AddProductController c;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Label('Product Description'),
          SellerInputField(
            validator:ProductLogic. validateDescription,
            controller: c.cDesc,
            hint: 'Write a detailed product description...',
            prefixIcon: Icons.notes_rounded,
            maxLines: 5,
          ),
        ],
      );
}
