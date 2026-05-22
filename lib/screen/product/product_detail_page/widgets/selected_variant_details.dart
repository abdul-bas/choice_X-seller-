import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/product/product_detail_page/widgets/detail_row.dart';
import 'package:flutter/material.dart';

class SelectedVariantDetails extends StatelessWidget {
  final Map<String, dynamic> selectedVariant;

  const SelectedVariantDetails({super.key, required this.selectedVariant});

  @override
  Widget build(BuildContext context) {
    final price = selectedVariant['Price']?.toString() ?? 'N/A';
    final discount = selectedVariant['discount']?.toString() ?? '0';
    final quantity = selectedVariant['qty']?.toString() ?? '0';
    final memory = selectedVariant['storage']?.toString() ?? 'N/A';
    final qty = int.tryParse(quantity) ?? 0;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.sellerBg,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          detailRow("Price", "₹$price",
              valueColor: AppColors.sellerAccentGreen),
          detailRow("Discount", "$discount%",
              valueColor: AppColors.sellerAccent),
          detailRow("Stock Quantity", quantity,
              valueColor:
                  qty > 10 ? AppColors.sellerHeading : AppColors.danger),
          detailRow("Memory", memory),
          detailRow("SKU Code", selectedVariant['SKUCode'] ?? 'N/A'),
        ],
      ),
    );
  }
}
