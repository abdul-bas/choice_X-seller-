
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/screen/product/edit_product/update_product.dart';
import 'package:choice_x_seller/screen/product/product_detail_page/product_detail_page.dart';
import 'package:flutter/material.dart';

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

  static void navigateToEdit(
    BuildContext context,
    ProductModel product,
  ) {
    showDialog(
      context: context,
      builder: (context) => UpdateProductScreen(
        product: product,
      ),
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

  static const productAddingItems = [
    (
      Icons.currency_rupee_rounded,
      'Fast, secure payouts directly to your bank'
    ),
    (
      Icons.headset_mic_outlined,
      'Dedicated seller support, every step of the way'
    ),
  ];
  static const sellerJourney = [
    (
      Icons.storefront_outlined,
      'List your products',
      'Set up your store in minutes with guided onboarding'
    ),
    (
      Icons.local_shipping_outlined,
      'We handle delivery',
      'Pan-India logistics network picks up from your door'
    ),
    (
      Icons.show_chart_rounded,
      'Watch your business grow',
      'Real-time dashboards, payouts, and seller insights'
    ),
    (
      Icons.verified_user_outlined,
      'Sell with confidence',
      'Full seller protection and dispute resolution support'
    ),
  ];

}
