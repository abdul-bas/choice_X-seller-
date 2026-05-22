 import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/seller_input_dd.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

  Widget deliveryDays() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Delivery (Days)'),
        GetBuilder<AddProductController>(
          id: 'delivery',
          builder: (c) => SellerInputDD(
            validator:ProductLogic. validateDeliveryDays,
            hint: 'Select',
            icon: Icons.delivery_dining,
            value: c.delivery,
            items:ProductLogic. deliveryDayOptions,
            onChanged: c.setDelivery,
          ),
        ),
      ],
    );
  }