import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/constants/variant_storage_opts.dart';
import 'package:choice_x_seller/state/get_x/variant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

Widget buildStorageRow() => GetBuilder<VariantController>(builder: (ctrl) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: variantStorageOpts.asMap().entries.map((e) {
          final isOn = ctrl.storageIndex == e.key;
          return GestureDetector(
            onTap: () => ctrl.setStorage(e.key),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
              decoration: BoxDecoration(
                color: isOn ? AppColors.brand : AppColors.variantSurfaceMid,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isOn ? AppColors.brand : AppColors.variantBorder,
                ),
                boxShadow: isOn
                    ? [
                        BoxShadow(
                          color: AppColors.shadowBrand,
                          blurRadius: 14,
                        )
                      ]
                    : [],
              ),
              child: Text(e.value,
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: isOn ? AppColors.white : AppColors.variantLabelMuted,
                  )),
            ),
          );
        }).toList(),
      );
    });
