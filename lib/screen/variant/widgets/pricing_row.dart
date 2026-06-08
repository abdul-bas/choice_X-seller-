 import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/variant/controller/controller.dart';
import 'package:choice_x_seller/state/get_x/variant_controller.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

Widget buildPricingRow(BuildContext context) =>
    GetBuilder<VariantController>(builder: (ctrl) {
      final discountClr =VariantLogic. discountColor(ctrl.discount);
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:        AppColors.variantSurface,
          borderRadius: BorderRadius.circular(16),
          border:       Border.all(color: AppColors.variantBorder),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            flex: 4,
            child: variantInputField(
              label:       'SELLING PRICE (₹)',
              hint:        '49,999',
              icon:        Icons.currency_rupee_rounded,
              ctrl:        ctrl.priceCtrl,
              type:        TextInputType.number,
              accentColor: AppColors.sellerWhite54,
              validator:   (v) {
                if (v == null || v.isEmpty) return 'Required';
                if (double.tryParse(v) == null) return 'Invalid';
                return null;
              },
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('DISCOUNT',
                        style: TextStyle(
                          fontSize:      9.5,
                          fontWeight:    FontWeight.w800,
                          color:         AppColors.variantLabelMuted,
                          letterSpacing: 1.5,
                        )),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color:        discountClr,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        if (ctrl.discount > 0) ...[
                          const Icon(Icons.local_offer_rounded,
                              size: 10, color: AppColors.white),
                          const SizedBox(width: 4),
                        ],
                        Text('${ctrl.discount.round()}% OFF',
                            style: TextStyle(
                              fontSize:   12,
                              fontWeight: FontWeight.w800,
                              color:      AppColors.grey100,
                            )),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight:        4,
                    overlayShape:       const RoundSliderOverlayShape(overlayRadius: 18),
                    activeTrackColor:   discountClr,
                    inactiveTrackColor: AppColors.variantInnerBg,
                    overlayColor:       discountClr,
                  ),
                  child: Slider(
                    value:     ctrl.discount,
                    min:       0,
                    max:       80,
                    divisions: 80,
                    onChanged: ctrl.setDiscount,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ['0%', '20%', '40%', '60%', '80%']
                        .map((l) => Text(l,
                            style: const TextStyle(
                              fontSize: 8.5,
                              color:    AppColors.variantLabelDeep,
                            )))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
    });
