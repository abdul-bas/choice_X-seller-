
  import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/seller_input_dd.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

  Widget typeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Product Type'),
        GetBuilder<AddProductController>(
          id: 'type',
          builder: (c) => SellerInputDD(
            validator:ProductLogic. validateProductType,
            hint: 'Select type',
            icon: Icons.devices_outlined,
            value: c.productType,
            items:ProductLogic. productTypeOptions,
            onChanged: c.setProductType,
          ),
        ),
      ],
    );
  }