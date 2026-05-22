import 'dart:convert';
import 'dart:typed_data';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';

import 'package:flutter/material.dart';

class ProductImageGallery extends StatefulWidget {
  final ProductModel product;
  final int variant;

  const ProductImageGallery({super.key, required this.product,required this.variant});

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      color: AppColors.sellerBg,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.product.variants[widget.variant].length,
        itemBuilder: (context, index) {
          final Uint8List bytes = base64Decode(widget.product.variants[widget.variant]['images'][index]);
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.memory(bytes, fit: BoxFit.contain),
          );
        },
      ),
    );
  }
}
