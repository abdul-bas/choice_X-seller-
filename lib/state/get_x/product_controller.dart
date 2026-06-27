import 'dart:convert';
import 'package:choice_x_seller/core/utils/helpers/id_generator.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/repository/auth_repository/repository.dart';

import 'package:choice_x_seller/state/bloc/product_add/product_crud_bloc.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_event.dart';
import 'package:choice_x_seller/state/get_x/filterProducts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  ProductModel? product;

  static const int totalPages = 3;
  int currentPage = 0;

  bool get isFirstPage => currentPage == 0;
  bool get isLastPage => currentPage == totalPages - 1;

  bool nextPage() {
    final errors = _validatePage(currentPage);
    if (errors.isNotEmpty) {
      pageErrors = errors;
      update(['pageErrors', 'page']);
      return false;
    }
    pageErrors = {};
    currentPage++;
    update(['page', 'pageErrors']);
    return true;
  }

  void prevPage() {
    if (currentPage > 0) {
      currentPage--;
      pageErrors = {};
      update(['page', 'pageErrors']);
    }
  }

  void goToPage(int index) {
    if (index <= currentPage) {
      currentPage = index;
      pageErrors = {};
      update(['page', 'pageErrors']);
    }
  }

  Map<String, String> pageErrors = {};

  String? fieldError(String field) => pageErrors[field];
  bool hasError(String field) => pageErrors.containsKey(field);

  final formKey = GlobalKey<FormState>();

  final cName = TextEditingController();
  final cModel = TextEditingController();
  final cDesc = TextEditingController();
  final cTags = TextEditingController();

  String? brand;
  String? category;
  String? productType;

  void setBrand(String? v) {
    if (v == null) return;
    brand = v;
    _clearError('brand');
    update(['brand']);
  }

  void setCategory(String? v) {
    if (v == null) return;
    category = v;
    _clearError('category');
    update(['category']);
  }

  void setProductType(String? v) {
    if (v == null) return;
    productType = v;
    _clearError('productType');
    update(['productType']);
  }

  final cWeight = TextEditingController();
  final cSize = TextEditingController();

  Set<String> selectedConn = {};
  String? warranty;
  String? delivery;
  List<Map<String, dynamic>> variants = [];

  int propartyIndex = 0;

  void toggleConn(String opt) {
    selectedConn.contains(opt)
        ? selectedConn.remove(opt)
        : selectedConn.add(opt);
    update(['conn']);
  }

  bool isConnSelected(String opt) => selectedConn.contains(opt);

  void setWarranty(String? v) {
    if (v == null) return;
    warranty = v;
    _clearError('warranty');
    update(['warranty']);
  }

  void setDelivery(String? v) {
    if (v == null) return;
    delivery = v;
    _clearError('delivery');
    update(['delivery']);
  }

  void setVariant(Map<String, dynamic> variant) {
    variants.add(variant);
    _clearError('variants');
    update(['variant']);
  }

  void updateVariant(Map<String, dynamic> variant, int index) {
    if (index < 0 || index >= variants.length) return;
    variants[index] = variant;
    update(['variant']);
  }

  void removeVariant(int index) {
    if (index < 0 || index >= variants.length) return;
    variants.removeAt(index);
    update(['variant']);
  }

  static const int _maxImages = 5;
  List<String> images = [];

  DateTime? mfgDate;
  DateTime? addedDate;

  bool get canAddMoreImages => images.length < _maxImages;

  Future<void> fileUplod(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      withData: true,
      type: FileType.image,
    );
    if (result == null) return;

    int skipped = 0;
    for (final file in result.files) {
      if (images.length >= _maxImages) {
        skipped++;
        continue;
      }
      if (file.bytes != null) images.add(base64Encode(file.bytes!));
    }

    if (skipped > 0) {
      _showSnack(
        context,
        'Only $_maxImages images allowed. $skipped file(s) were skipped.',
      );
    }
    _clearError('images');
    update();
  }

  void removeImage(int index) {
    if (index < 0 || index >= images.length) return;
    images.removeAt(index);
    update();
  }

  Future<void> pickDate(BuildContext context, bool isMfg) async {
    final initial =
        isMfg ? (mfgDate ?? DateTime.now()) : (addedDate ?? DateTime.now());

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
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
    if (picked == null) return;

    if (isMfg) {
      mfgDate = picked;
      update(['mfgDate']);
    } else {
      addedDate = picked;
      update(['addedDate']);
    }
  }

  bool isSearchOpen = false;

  void toggleSearch() {
    isSearchOpen = !isSearchOpen;
    update(['search']);
  }

  void closeSearch(FilterProducts filterController) {
    filterController.clearSearchField();
    isSearchOpen = false;
    update(['search']);
  }

  bool isSubmitting = false;

  Future<void> submitCreate(BuildContext context) async {
    final errors = _validatePage(2);
    if (errors.isNotEmpty) {
      pageErrors = errors;
      update(['pageErrors']);
      return;
    }

    if ((formKey.currentState?.validate() ?? false)) {
      _showSnack(context, 'Please fill all required fields');
      return;
    }

    final deliveryDays = int.tryParse(delivery ?? '');
    if (deliveryDays == null) {
      _showSnack(context, 'Invalid delivery days value');
      return;
    }

    if (isSubmitting) return;
    isSubmitting = true;
    update(['submit']);

    try {
      final sellerId = AuthRepository().sellerId();

      final model = ProductModel(
        id: generateProductId(),
        sellerId: sellerId,
        productName: cName.text.trim(),
        brand: brand!,
        model: cModel.text.trim(),
        description: cDesc.text.trim(),
        category: category!,
        productType: productType!,
        connectivityOptions: List<String>.from(selectedConn),
        warranty: warranty!,
        size: cSize.text.trim(),
        tag: cTags.text.trim(),
        manufactureDate: mfgDate!,
        addedDate: addedDate!,
        status: 'Live',
        imges: List<String>.from(images),
        weight: cWeight.text.trim(),
        variants: List<Map<String, dynamic>>.from(variants),
        expectedDeliveryDays: deliveryDays,
      );

      context.read<ProductCrudBloc>().add(AddProduct(model: model));

      clearAll();
      Navigator.of(context).pop();
    } catch (e) {
      _showSnack(context, 'Failed to create product. Please try again.');
    } finally {
      isSubmitting = false;
      update(['submit']);
    }
  }

  Future<void> submitEdit(BuildContext context) async {
    final errors = _validatePage(2);
    if (errors.isNotEmpty) {
      pageErrors = errors;
      update(['pageErrors']);
      return;
    }

    if ((formKey.currentState?.validate() ?? false)) {
      _showSnack(context, 'Please fill all required fields');
      return;
    }

    final deliveryDays = int.tryParse(delivery ?? '');
    if (deliveryDays == null) {
      _showSnack(context, 'Invalid delivery days value');
      return;
    }

    if (isSubmitting) return;
    isSubmitting = true;
    update(['submit']);

    try {
      final model = ProductModel(
        id: product!.id,
        sellerId: product!.sellerId,
        productName: cName.text.trim(),
        brand: brand!,
        model: cModel.text.trim(),
        description: cDesc.text.trim(),
        category: category!,
        productType: productType!,
        connectivityOptions: selectedConn.toList(),
        warranty: warranty!,
        size: cSize.text.trim(),
        tag: cTags.text.trim(),
        manufactureDate: mfgDate!,
        addedDate: DateTime.now(),
        status: product!.status,
        imges: List<String>.from(images),
        weight: cWeight.text.trim(),
        variants: List<Map<String, dynamic>>.from(variants),
        expectedDeliveryDays: deliveryDays,
      );
      print(
          '--------------------------------------------------------------------------------------------------------------------------');
      context.read<ProductCrudBloc>().add(EditProduct(product: model));

      Navigator.of(context).pop();
    } catch (e) {
      _showSnack(context, '${e}');
    } finally {
      isSubmitting = false;
      update(['submit']);
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (product != null) _initFromProduct(product!);
    _attachTextListeners();
  }

  @override
  void onClose() {
    cName.dispose();
    cModel.dispose();
    cDesc.dispose();
    cTags.dispose();
    cWeight.dispose();
    cSize.dispose();
    super.onClose();
  }

  Map<String, String> _validatePage(int page) {
    final e = <String, String>{};
    switch (page) {
      case 0:
        if (cName.text.trim().isEmpty) e['name'] = 'Product name is required';
        if (cModel.text.trim().isEmpty) e['model'] = 'Model number is required';
        if (cDesc.text.trim().isEmpty) e['desc'] = 'Description is required';
        if (brand == null || brand!.isEmpty)
          e['brand'] = 'Please select a brand';
        if (category == null || category!.isEmpty) {
          e['category'] = 'Please select a category';
        }
        if (productType == null || productType!.isEmpty)
          e['productType'] = 'Please select a product type';
        break;

      case 1:
        if (variants.isEmpty) e['variants'] = 'Add at least one variant';
        if (warranty == null || warranty!.isEmpty)
          e['warranty'] = 'Please select a warranty period';
        if (delivery == null || delivery!.isEmpty)
          e['delivery'] = 'Please select expected delivery days';
        if (int.tryParse(delivery ?? '') == null && delivery != null)
          e['delivery'] = 'Delivery days must be a number';
        break;

      case 2:
        if (images.isEmpty) e['images'] = 'Add at least one product image';
        if (mfgDate == null) e['mfgDate'] = 'Select a manufacture date';
        if (addedDate == null) e['addedDate'] = 'Select an added date';
        break;
    }
    return e;
  }

  void clearAll() {
    cName.clear();
    cModel.clear();
    cDesc.clear();
    cTags.clear();
    cWeight.clear();
    cSize.clear();

    selectedConn.clear();

    brand = category = productType = warranty = delivery = null;
    mfgDate = addedDate = null;
    variants.clear();
    images.clear();

    currentPage = 0;
    pageErrors = {};
    isSubmitting = false;
    isSearchOpen = false;
    propartyIndex = 0;

    update();
  }

  void initFromProduct(ProductModel p) {
    product = p;
    _initFromProduct(p);
  }

  void _initFromProduct(ProductModel p) {
    cName.text = p.productName;
    cModel.text = p.model;
    cDesc.text = p.description;
    cWeight.text = p.weight ?? '';
    cSize.text = p.size;
    cTags.text = p.tag;

    selectedConn
      ..clear()
      ..addAll(p.connectivityOptions);

    mfgDate = p.manufactureDate;
    addedDate = p.addedDate;

    brand = p.brand;
    category = p.category;
    productType = p.productType;
    warranty = p.warranty;
    delivery = p.expectedDeliveryDays.toString();

    variants = List<Map<String, dynamic>>.from(p.variants);
    images = List<String>.from(p.imges);

    currentPage = 0;
    pageErrors = {};
    update();
  }

  void _attachTextListeners() {
    cName.addListener(() => _clearError('name'));
    cModel.addListener(() => _clearError('model'));
    cDesc.addListener(() => _clearError('desc'));
  }

  void _clearError(String field) {
    if (pageErrors.containsKey(field)) {
      pageErrors.remove(field);
      update(['pageErrors']);
    }
  }

  void _showSnack(BuildContext context, String msg, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor:
            isError ? const Color(0xFFE24B4A) : const Color(0xFF1D9E75),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  deleteVariant(int index) {
    variants.removeAt(index);
    update();
  }
}
