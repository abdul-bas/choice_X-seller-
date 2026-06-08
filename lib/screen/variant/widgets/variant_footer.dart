import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/variant/controller/controller.dart';
import 'package:choice_x_seller/state/get_x/variant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';

Widget buildVariantFooter(BuildContext context, dynamic formKey) =>
    Row(children: [
      GetBuilder<VariantController>(builder: (ctrl) {
        final filled = ctrl.colorIndex != null &&
            ctrl.storageIndex != null &&
            ctrl.qtyCtrl.text.isNotEmpty &&
            ctrl.priceCtrl.text.isNotEmpty;
        return Row(children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width:  7,
            height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: filled
                  ? AppColors.variantReadyDot
                  : AppColors.variantLabelDeep,
              boxShadow: filled
                  ? [
                      BoxShadow(
                        color:      AppColors.variantReadyGlow,
                        blurRadius: 8,
                      )
                    ]
                  : [],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            filled ? 'Ready to save' : 'Fill required fields',
            style: TextStyle(
              fontSize: 11,
              color:    filled
                  ? AppColors.variantLabelMuted
                  : AppColors.variantLabelDeep,
            ),
          ),
        ]);
      }),
      const Spacer(),
      // Discard button
      GestureDetector(
        onTap: () {
          Get.find<VariantController>().reset();
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          decoration: BoxDecoration(
            color:        AppColors.variantSurfaceMid,
            borderRadius: BorderRadius.circular(11),
            border:       Border.all(color: AppColors.variantBorder),
          ),
          child: const Text('Discard',
              style: TextStyle(
                fontSize:   13,
                fontWeight: FontWeight.w600,
                color:      AppColors.variantLabelMuted,
              )),
        ),
      ),
      const SizedBox(width: 10),
      // Save button  — form validation + VariantModel construction
      GestureDetector(
        onTap: () =>VariantLogic. onSaveTap(context, formKey),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
          decoration: BoxDecoration(
            color:        AppColors.white,
            borderRadius: BorderRadius.circular(11),
          ),
          child: const Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.check_circle_outline_rounded,
                size: 16, color: AppColors.black87),
            SizedBox(width: 8),
            Text('Save Variant',
                style: TextStyle(
                  fontSize:   13.5,
                  fontWeight: FontWeight.w800,
                  color:      AppColors.black87,
                )),
          ]),
        ),
      ),
    ]);
