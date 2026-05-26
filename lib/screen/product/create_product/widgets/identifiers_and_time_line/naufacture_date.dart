
 
import 'package:choice_x_seller/core/utils/helpers/date_formatter.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/seller_date_tap.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

  Widget manufactureDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Manufacture Date'),
        GetBuilder<AddProductController>(
          id: 'mfgDate',
          builder: (c) => SellerDateTap(
            value: formatDate(c.mfgDate),
            hint: 'Select date',
            icon: Icons.event_outlined,
            onTap: () => c.pickDate(context, true),
          ),
        ),
      ],
    );
  }