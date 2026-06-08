
  import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/common/input_fields/seller_input_field.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:flutter/material.dart';

  Widget weightField(dynamic c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Weight (kg)'),
        SellerInputField(
          validator:ProductLogic. validateWeight,
          controller: c.cWeight,
          hint: 'e.g. 2.5',
          prefixIcon: Icons.scale_outlined,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }