import 'dart:convert';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/state/get_x/filterProducts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class  AddProductController extends GetxController {
  ProductModel? product;

  final cName = TextEditingController();
  final cModel = TextEditingController();
  final cDesc = TextEditingController();
  final cWeight = TextEditingController();
  final cSize = TextEditingController();
  final cTags = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final Set<String> selectedConn = {};
  int propartyIndex = 0;

  bool isSearchOpen = false;

  DateTime? mfgDate;
  DateTime? addedDate;

  String? brand;
  String? category;
  String? productType;
  String? warranty;
  String? delivery;

  List<Map<String, dynamic>> variants = [];
  List<String> images = [];

  void toggleSearch() {
    isSearchOpen = !isSearchOpen;
    update(['search']);
  }

  void closeSearch(FilterProducts filterController) {
    filterController.clearSearchField();
    isSearchOpen = false;
    update(['search']);
  }

  void clearAll() {
    cName.clear();
    cModel.clear();
    cDesc.clear();
    cWeight.clear();
    cSize.clear();
    cTags.clear();

    selectedConn.clear();

    mfgDate = null;
    addedDate = null;

    brand = null;
    category = null;
    productType = null;
    warranty = null;
    delivery = null;

    variants.clear();
    images.clear();

    isSearchOpen = false;
  }

  @override
  void onInit() {
    super.onInit();

    if (product != null) {
      initFromProduct(product!);
    }
  }

  @override
  void onClose() {
    cName.dispose();
    cModel.dispose();
    cDesc.dispose();
    cWeight.dispose();
    cSize.dispose();
    cTags.dispose();

    super.onClose();
  }

  void toggleConn(String opt) {
    selectedConn.contains(opt)
        ? selectedConn.remove(opt)
        : selectedConn.add(opt);

    update(['conn']);
  }

  void setBrand(String? v) {
    if (v != null) {
      brand = v;
      update(['brand']);
    }
  }

  void setCategory(String? v) {
    if (v != null) {
      category = v;
      update(['category']);
    }
  }

  void setProductType(String? v) {
    if (v != null) {
      productType = v;
      update(['type']);
    }
  }

  void setWarranty(String? v) {
    if (v != null) {
      warranty = v;
      update(['warranty']);
    }
  }

  void setDelivery(String? v) {
    if (v != null) {
      delivery = v;
      update(['delivery']);
    }
  }

  void setVariant(Map<String, dynamic> variant) {
    variants.add(variant);
    update();
  }

  void updateVariant(
    Map<String, dynamic> variant,
    int index,
  ) {
    variants[index] = variant;
    update();
  }

  Future<void> pickDate(
    BuildContext context,
    bool isMfg,
  ) async {
    final d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (ctx, child) => Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF7C6EF5),
          ),
        ),
        child: child!,
      ),
    );

    if (d == null) return;

    if (isMfg) {
      mfgDate = d;
      update(['mfgDate']);
    } else {
      addedDate = d;
      update(['addedDate']);
    }
  }

  Future<void> fileUplod(
    BuildContext context,
  ) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      withData: true,
    );

    if (result != null) {
      for (var file in result.files) {
        if (images.length >= 5) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'You can only upload up to 5 images.',
              ),
            ),
          );
          break;
        }

        if (file.bytes != null) {
          images.add(
            base64Encode(file.bytes!),
          );
        }
      }

      update();
    }
  }

  void removeImage(int index) {
    images.removeAt(index);
    update();
  }

  void initFromProduct(ProductModel product) {
    cName.text = product.productName;
    cModel.text = product.model;
    cDesc.text = product.description;
    cWeight.text = product.weight ?? '';
    cSize.text = product.size;
    cTags.text = product.tag;

    selectedConn.clear();
    selectedConn.addAll(
      product.connectivityOptions,
    );

    mfgDate = product.manufactureDate;
    addedDate = product.addedDate;

    brand = product.brand;
    category = product.category;
    productType = product.productType;
    warranty = product.warranty;
    delivery = product.expectedDeliveryDays.toString();

    variants = List.from(product.variants);
    images = List.from(product.imges);

    update();
  }
  
}
