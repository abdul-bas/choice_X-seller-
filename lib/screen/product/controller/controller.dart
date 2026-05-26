import 'package:choice_x_seller/core/utils/helpers/id_generator.dart';
import 'package:choice_x_seller/core/utils/snackbar/error_snackbar.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/repository/auth_repository/repository.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/basic_details/basic_deails.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/section_card/section_card.dart';
import 'package:choice_x_seller/screen/product/edit_product/edit_product.dart';
import 'package:choice_x_seller/screen/product/product_detail_page/product_detail_page.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_bloc.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_event.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductLogic {
  static const List<String> connectivityOptions = [
    'Wi-Fi',
    'Bluetooth',
    'USB-C',
    'HDMI',
    'Ethernet',
    'NFC',
    '5G',
    '4G',
  ];

  static const List<String> warrantyOptions = [
    '6 Months',
    '1 Year',
    '2 Years',
    '3 Years',
    'No Warranty',
    'Lifetime Warranty',
  ];

  static const List<String> productTypeOptions = [
    'Laptop',
    'Desktop',
    'Monitor',
    'Television',
    'Headphone',
    'Speaker',
    'Camera',
    'Refrigerator',
    'Washing Machine',
    'Microwave',
    'Router',
    'Printer',
    'Smartwatch',
    'Other',
  ];

  static const List<String> deliveryDayOptions = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
  ];

  static const List<(String, String)> productAddingStepLabels = [
    ('1', 'Basic Details'),
    ('2', 'Description'),
    ('3', 'Category & Type'),
    ('4', 'Variant'),
    ('5', 'Connectivity & Warranty'),
    ('6', 'Physical Attributes'),
    ('7', 'Product Images'),
    ('8', 'Identifiers & Timeline'),
  ];

  static String? validateProductName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Product Name is required';
    }
    return null;
  }

  static String? validateBrand(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Brand is required';
    }
    return null;
  }

  static String? validateModel(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Model name is required';
    }
    if (value.trim().length < 3) {
      return 'Model name must be at least 3 characters';
    }
    return null;
  }

  static String? validateCategory(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Category is required';
    }
    if (value.trim().length < 3) {
      return 'Category name is too short';
    }
    return null;
  }

  static String? validateProductType(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Product type is required';
    }
    if (value.trim().length < 3) {
      return 'Product type is too short';
    }
    return null;
  }

  static String? validateWarranty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Warranty is required';
    }
    if (value.trim().length < 3) {
      return 'Enter valid warranty details';
    }
    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Description is required';
    }
    return null;
  }

  static String? validateWeight(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Weight is required';
    }

    final weight = double.tryParse(value);

    if (weight == null) return 'Enter a valid weight';
    if (weight <= 0) return 'Weight must be greater than 0';
    if (weight > 1000) return 'Weight is too high';

    return null;
  }

  static String? validateSize(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Size / Dimensions is required';
    }

    if (value.trim().length < 3) {
      return 'Enter valid dimensions';
    }

    return null;
  }

  static String? validateTags(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'At least one tag is required';
    }

    final tags = value.split(',');

    if (tags.isEmpty) return 'Enter at least one keyword';
    if (tags.length > 10) return 'Maximum 10 keywords allowed';

    return null;
  }

  static String? validateDeliveryDays(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Delivery days is required';
    }

    final days = int.tryParse(value);

    if (days == null) return 'Enter a valid number';
    if (days <= 0) return 'Delivery days must be greater than 0';
    if (days > 365) return 'Delivery days is too high';

    return null;
  }

  static Future<void> submitCreateProduct({
    required AddProductController c,
    required BuildContext context,
  }) async {
    final isFormValid = c.formKey.currentState?.validate() ?? false;

    if (!isFormValid) {
      showError('Please fill all required fields', context);
      return;
    }

    if (c.brand == null ||
        c.category == null ||
        c.productType == null ||
        c.warranty == null ||
        c.delivery == null) {
      showError(
        'Please select all dropdown fields',
        context,
      );
      return;
    }

    if (c.mfgDate == null || c.addedDate == null) {
      showError(
        'Please select manufacture and added date',
        context,
      );
      return;
    }

    if (c.images.isEmpty) {
      showError(
        'Please upload at least one image',
        context,
      );
      return;
    }

    if (c.variants.isEmpty) {
      showError(
        'Please add at least one variant',
        context,
      );
      return;
    }

    final deliveryDays = int.tryParse(c.delivery!);

    if (deliveryDays == null) {
      showError('Invalid delivery days', context);
      return;
    }

    final sellerId = AuthRepository().sellerId();

    final productModel = ProductModel(
      expectedDeliveryDays: deliveryDays,
      id: generateProductId(),
      sellerId: sellerId,
      productName: c.cName.text.trim(),
      brand: c.brand!,
      model: c.cModel.text.trim(),
      description: c.cDesc.text.trim(),
      category: c.category!,
      productType: c.productType!,
      connectivityOptions: List.from(
        c.selectedConn,
      ),
      warranty: c.warranty!,
      size: c.cSize.text.trim(),
      tag: c.cTags.text.trim(),
      manufactureDate: c.mfgDate ?? DateTime.now(),
      addedDate: c.addedDate ?? DateTime.now(),
      status: 'Live',
      imges: List<String>.from(c.images),
      weight: c.cWeight.text.trim(),
      variants: List<Map<String, dynamic>>.from(
        c.variants,
      ),
    );
    context.read<ProductCrudBloc>().add(
          AddProduct(model: productModel),
        );

    c.clearAll();

    Navigator.pop(context);
  }

  static String fmtPrice(double v) {
    final s = v.toStringAsFixed(0);

    return s.length > 3
        ? '${s.substring(0, s.length - 3)},${s.substring(s.length - 3)}'
        : s;
  }

  static double effectivePrice(
    double rawPrice,
    double discount,
  ) {
    return discount > 0 ? rawPrice * (1 - discount / 100) : rawPrice;
  }

  static Future<void> submitEditProduct({
    required GlobalKey<FormState> formKey,
    required AddProductController c,
    required ProductModel product,
    required BuildContext context,
  }) async {
    if (!formKey.currentState!.validate()) return;

    final brand = c.brand;
    final category = c.category;
    final productType = c.productType;
    final warranty = c.warranty;
    final delivery = c.delivery;
    final images = c.images;
    final variants = c.variants;
    final mfgDate = c.mfgDate;
    final addedDate = c.addedDate;
    if(c.cName.text.isNotEmpty&&c.brand.isNotEmpty&&c.cModel){
      c.pro
    }
//......................................................
    if (brand == null ||
        category == null ||
        productType == null ||
        warranty == null ||
        delivery == null) {
      showError('Please select all dropdown fields', context);
      return;
    }

    if (mfgDate == null || addedDate == null) {
      showError(
        'Please select manufacture and added date',
        context,
      );
      return;
    }

    if (images.isEmpty) {
      showError(
        'Please upload at least one image',
        context,
      );
      return;
    }

    if (variants.isEmpty) {
      showError(
        'Please add at least one variant',
        context,
      );
      return;
    }

    final deliveryDays = int.tryParse(delivery);

    if (deliveryDays == null) {
      showError('Invalid delivery days', context);
      return;
    }

    final productModel = ProductModel(
      expectedDeliveryDays: deliveryDays,
      id: product.id,
      sellerId: product.sellerId,
      productName: c.cName.text.trim(),
      brand: brand,
      model: c.cModel.text.trim(),
      description: c.cDesc.text.trim(),
      category: category,
      productType: productType,
      connectivityOptions: c.selectedConn.toList(),
      warranty: warranty,
      size: c.cSize.text.trim(),
      tag: c.cTags.text.trim(),
      manufactureDate: mfgDate,
      addedDate: DateTime.now(),
      status: product.status,
      imges: images,
      weight: c.cWeight.text.trim(),
      variants: variants,
    );

    context.read<ProductCrudBloc>().add(
          EditProduct(product: productModel),
        );

    Navigator.of(context).pop();
  }

  static void navigateToEdit(
    BuildContext context,
    ProductModel product,
  ) {
    showDialog(
      context: context,
      builder: (context) => EditProductScreen(product: product),
    );
  }

  static void navigateToDetail(
    BuildContext context,
    ProductModel product,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SellerProductDetailPage(
          product: product,
        ),
      ),
    );
  }



 
}
