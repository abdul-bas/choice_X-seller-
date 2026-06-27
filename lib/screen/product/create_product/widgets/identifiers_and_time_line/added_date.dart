
import 'package:choice_x_seller/core/utils/helpers/date_formatter.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/seller_date_tap.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

  Widget addedDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Added Date'),
        GetBuilder<AddProductController>(
          id: 'addedDate',
          builder: (c) => SellerDateTap(
            value: formatDate(c.addedDate),
            hint: 'Select date',
            icon: Icons.calendar_today_outlined,
            onTap: () => c.pickDate(context, false),
          ),
        ),
      ],
    );
  }