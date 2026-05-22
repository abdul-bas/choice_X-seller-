 import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/get_x/variant_controller.dart';
import 'package:choice_x_seller/screen/variant/widgets/sku_cart.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

Widget buildVariantDetailsRow(BuildContext context) =>
    GetBuilder<VariantController>(builder: (ctrl) {
      return Column(children: [
        buildSkuCard(context, ctrl),
        const SizedBox(height: 12),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: variantInputField(
              label:       'QUANTITY',
              hint:        'e.g. 100',
              icon:        Icons.inventory_2_outlined,
              ctrl:        ctrl.qtyCtrl,
              type:        TextInputType.number,
              accentColor: AppColors.sellerWhite54,
              validator:   (v) {
                if (v == null || v.isEmpty) return 'Required';
                if (int.tryParse(v) == null || int.parse(v) <= 0)
                  return 'Invalid qty';
                return null;
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: variantInputField(
              label:       'POWER (W)',
              hint:        'e.g. 65W',
              icon:        Icons.bolt_rounded,
              ctrl:        ctrl.powerCtrl,
              accentColor: AppColors.sellerWhite54,
              validator:   (v) =>
                  (v == null || v.isEmpty) ? 'Required' : null,
            ),
          ),
        ]),
      ]);
    });
