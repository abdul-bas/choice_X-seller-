
  import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/seller_input_field.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:flutter/material.dart';

  Widget sizeField(dynamic c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Size / Dimensions'),
        SellerInputField(
          validator:ProductLogic. validateSize,
          controller: c.cSize,
          hint: 'e.g. 55 inch / 30×40 cm',
          prefixIcon: Icons.straighten_outlined,
        ),
      ],
    );
  }