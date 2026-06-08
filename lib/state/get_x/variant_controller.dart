import 'dart:convert';
import 'dart:math';
import 'package:choice_x_seller/core/constants/variant_input_colors.dart';
import 'package:choice_x_seller/core/constants/variant_storage_opts.dart';
import 'package:choice_x_seller/models/variant_model/variant_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class VariantController extends GetxController {
  int? colorIndex;
  int? storageIndex;
  int? activeImage = 0;
  double discount = 0;
  bool autoSku = true;

  List<String> variantImages = List.generate(4, (_) => '');

  final skuCtrl = TextEditingController();
  final qtyCtrl = TextEditingController();
  final powerCtrl = TextEditingController();
  final priceCtrl = TextEditingController();

  @override
  void onClose() {
    skuCtrl.dispose();
    qtyCtrl.dispose();
    powerCtrl.dispose();
    priceCtrl.dispose();
    variantImages = List.generate(4, (_) => '');
    colorIndex = null;
    storageIndex = null;
    activeImage = null;
    update();
    super.onClose();
  }

  void reset() {
    skuCtrl.clear();
    qtyCtrl.clear();
    powerCtrl.clear();
    priceCtrl.clear();

    variantImages = List.generate(4, (_) => '');
    colorIndex = null;
    storageIndex = null;
    activeImage = 0;
    discount = 0;
    autoSku = true;

    update();
  }

  void regenerateSku() {
    if (!autoSku) return;
    final c = colorIndex != null ? variantColors[colorIndex!] : null;
    final s = storageIndex != null ? variantStorageOpts[storageIndex!] : null;
    final cp =
        c != null ? c.substring(0, min(3, c.length)).toUpperCase() : 'GEN';
    final sp = s != null && s != 'None'
        ? s.replaceAll(' ', '').replaceAll('GB', 'G').replaceAll('TB', 'T')
        : 'STD';
    skuCtrl.text = '$cp-$sp-${1000 + Random().nextInt(8999)}';
    update();
  }

  void setColor(int idx) {
    colorIndex = idx;
    regenerateSku();
  }

  void setStorage(int idx) {
    storageIndex = idx;
    regenerateSku();
  }

  void setActiveImage(int idx) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.single.bytes != null) {
      final image = base64Encode(result.files.single.bytes!);
      variantImages[idx] = image;
      activeImage = idx;
      update();
    }
  }

  void setDiscount(double val) {
    discount = val;
    update();
  }

  void toggleSku() {
    autoSku = !autoSku;
    if (autoSku) regenerateSku();
    update();
  }

  void setVariantsForEdit(VariantModel variant) {
    reset();

    colorIndex = variantColors.indexWhere(
      (c) => c.toLowerCase() == variant.color.toLowerCase().trim(),
    );
    debugPrint('$colorIndex');
    
    storageIndex = variantStorageOpts.indexWhere(
      (s) => s.toLowerCase() == variant.storage.toLowerCase().trim(),
    );
    
    discount = double.tryParse(variant.discount) ?? 0;

    skuCtrl.text = variant.sku;
    qtyCtrl.text = variant.qty;
    powerCtrl.text = variant.power;
    priceCtrl.text = variant.price;

    variantImages = List<String>.from(variant.images);
  
  debugPrint('Color: ${variant.color}');
  debugPrint('Color Index: $colorIndex');

  debugPrint('Storage: ${variant.storage}');
  debugPrint('Storage Index: $storageIndex');

  debugPrint('Discount: $discount');
  debugPrint('SKU: ${skuCtrl.text}');
  debugPrint('Qty: ${qtyCtrl.text}');
  debugPrint('Power: ${powerCtrl.text}');
  debugPrint('Price: ${priceCtrl.text}');
  debugPrint('Images Count: ${variantImages.length}');


    update();
  }
}
