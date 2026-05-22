import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/screen/product/product_detail_page/widgets/spec_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SpecificationDetailsSheet extends StatelessWidget {
  final ProductModel product;
  final ScrollController scrollController;

  const SpecificationDetailsSheet({
    super.key,
    required this.product,
    required this.scrollController,
  });

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        controller: scrollController,
        children: [
        
          Center(
            child: Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.sellerBodyText.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 15),

          Text(
            "Full Product Specifications",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.sellerHeading,
            ),
          ),
          const SizedBox(height: 15),

          // Description
          Text(
            "Description",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.sellerHeading,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.description,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.sellerBodyText,
              height: 1.5,
            ),
          ),
          Divider(height: 30, color: AppColors.sellerBorder),

          // General Details
          Text(
            "General Details",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.sellerHeading,
            ),
          ),
          const SizedBox(height: 15),
          specRow("Model Name", product.model),
          specRow("Warranty",   product.warranty),
          specRow("Weight",     product.weight ?? "N/A"),
          specRow("Size",       product.size),
          specRow("Status",     product.status),
          Divider(height: 30, color: AppColors.sellerBorder),

          
          Text(
            "Dates",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.sellerHeading,
            ),
          ),
          const SizedBox(height: 15),
          specRow("Manufacture Date", product.manufactureDate),
          specRow("Added Date",       product.addedDate),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}