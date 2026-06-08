
  import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/common/input_fields/seller_input_field.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:flutter/material.dart';

  Widget modelField(dynamic c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Model'),
        SellerInputField(
          validator:ProductLogic. validateModel,
          controller: c.cModel,
          hint: 'e.g. Bravia X80L',
          prefixIcon: Icons.precision_manufacturing_outlined,
        ),
      ],
    );
  }