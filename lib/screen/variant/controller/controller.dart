import 'package:choice_x_seller/core/constants/app_color.dart' as Colors;
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/constants/variant_input_colors.dart';
import 'package:choice_x_seller/core/constants/variant_storage_opts.dart';
import 'package:choice_x_seller/models/variant_model/variant_model.dart';
import 'package:choice_x_seller/state/get_x/variant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class VariantLogic {
 static Color discountColor(double discount) {
  if (discount < 20) return Colors.green;
  if (discount < 50) return AppColors.variantDiscountMidBg;
  return AppColors.danger;
}
static void onSaveTap(BuildContext context, dynamic formKey) {
  if (!(formKey.currentState?.validate() ?? false)) return;

  final ctrl  = Get.find<VariantController>();
  final sku   = ctrl.skuCtrl.text.trim();
  final qty   = ctrl.qtyCtrl.text.trim();
  final power = ctrl.powerCtrl.text.trim();
  final price = ctrl.priceCtrl.text.trim();
  final dis   = ctrl.discount;

  final isComplete = sku.isNotEmpty &&
      qty.isNotEmpty &&
      power.isNotEmpty &&
      price.isNotEmpty &&
      ctrl.colorIndex   != null &&
      ctrl.storageIndex != null &&
      ctrl.variantImages.isNotEmpty;

  if (!isComplete) return;

  ctrl.variantImages.removeWhere((img) => img.isEmpty);

  final variant = VariantModel(
    sku:      sku,
    qty:      qty,
    power:    power,
    price:    price,
    color:    variantColors[ctrl.colorIndex ?? 0],
    storage:  variantStorageOpts[ctrl.storageIndex ?? 0],
    discount: dis.toString(),
    images:   ctrl.variantImages,
  );

  Navigator.pop(context, variant.toMap());
  ctrl.reset();
}
}