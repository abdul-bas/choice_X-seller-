import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterProducts extends GetxController {
  final RxList<ProductModel> allProducts = <ProductModel>[].obs;

  final RxList<ProductModel> filteredProducts = <ProductModel>[].obs;

  final TextEditingController searchEditingController = TextEditingController();

  void setProducts(
    List<ProductModel> list,
  ) {
    allProducts.value = list;

    filteredProducts.value = List.from(list);
  }

  void filterProducts(String query) {
    final q = query.toLowerCase().trim();

    if (q.isEmpty) {
      filteredProducts.value = List.from(allProducts);
    } else {
      filteredProducts.value = allProducts.where((p) {
        return p.productName.toLowerCase().contains(q) ||
            p.category.toLowerCase().contains(q) ||
            p.brand.toLowerCase().contains(q) ||
            p.model.toLowerCase().contains(q) ||
            p.size.toLowerCase().contains(q) ||
            p.warranty.toLowerCase().contains(q) ||
            (p.weight ?? '').toLowerCase().contains(q) ||
            p.status.toLowerCase().contains(q) ||
            p.productType.toLowerCase().contains(q);
      }).toList();
    }
  }

  void clearSearchField() {
    searchEditingController.clear();

    filteredProducts.value = List.from(allProducts);
  }

  @override
  void onClose() {
    searchEditingController.dispose();

    super.onClose();
  }
}
