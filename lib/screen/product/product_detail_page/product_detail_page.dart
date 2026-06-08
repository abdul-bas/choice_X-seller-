import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/screen/product/product_detail_page/dialogs/show_specification_dialog.dart';
import 'package:choice_x_seller/screen/product/product_detail_page/widgets/info_chip.dart';
import 'package:choice_x_seller/screen/product/product_detail_page/widgets/product_image_gallery.dart';
import 'package:choice_x_seller/screen/product/product_detail_page/widgets/selected_variant_details.dart';
import 'package:choice_x_seller/screen/product/product_detail_page/widgets/variant_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SellerProductDetailPage extends StatelessWidget {
  final ProductModel product;
  final ValueNotifier<int> _variantIndex = ValueNotifier(0);

  SellerProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sellerBg,
      appBar: AppBar(
        backgroundColor: AppColors.sellerBg,
        foregroundColor: AppColors.sellerHeading,
        elevation: 0,
        title: Text(
          "Product Listing",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: _variantIndex,
            builder: (context, value, child) {
              return ProductImageGallery(product: product,variant: value,);
            }
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: AppColors.sellerSurface,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.sellerHeading,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.brand,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.sellerBodyText,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        InfoChip(
                          title: "Category",
                          value: product.category,
                          color: AppColors.sellerAccent,
                        ),
                        const SizedBox(width: 10),
                        InfoChip(
                          title: "Type",
                          value: product.productType,
                          color: AppColors.sellerAccentGreen,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Variants Available",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.sellerHeading,
                      ),
                    ),
                    const SizedBox(height: 10),
                    VariantPicker(
                      variants: product.variants,
                      variantIndex: _variantIndex,
                    ),
                    const SizedBox(height: 20),
                    ValueListenableBuilder<int>(
                      valueListenable: _variantIndex,
                      builder: (context, index, _) {
                        final selectedVariant = product.variants[index];
                        return SelectedVariantDetails(
                          selectedVariant: selectedVariant,
                        );
                      },
                    ),
                    Divider(height: 30, color: AppColors.sellerBorder),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                        icon: const Icon(
                          Icons.description,
                          color: AppColors.sellerAccent,
                        ),
                        label: Text(
                          "View Full Specifications",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: AppColors.sellerAccent,
                          ),
                        ),
                        onPressed: () => showSpecificationsSheet(context, product),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: AppColors.activeBg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}