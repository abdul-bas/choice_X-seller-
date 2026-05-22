import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/screen/product/read_product/mobile_view/widgets/action_buttons/buttons.dart';
import 'package:choice_x_seller/screen/product/read_product/mobile_view/widgets/header/header.dart';
import 'package:choice_x_seller/screen/product/read_product/mobile_view/widgets/product_detais/product_detais.dart';
import 'package:flutter/material.dart';

class MobileProductView extends StatelessWidget {
  const MobileProductView({
    super.key,
    required this.product,
    this.onEdit,
    this.onToggleStatus,
    this.onDelete,
    this.onViewDetails,
  });

  final ProductModel product;
  final VoidCallback? onEdit;
  final VoidCallback? onToggleStatus;
  final VoidCallback? onDelete;
  final VoidCallback? onViewDetails;

  @override
  Widget build(BuildContext context) {
    final isLive = product.status.toLowerCase() == 'live';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.black,                       
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.sellerBorder, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: isLive
                ? AppColors.brand.withValues(alpha: 0.08) 
                : AppColors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductReadHeader(
            isLive: isLive,
            product: product,
            onToggleStatus: onToggleStatus,
          ),
          ProductReadDetails(
            product: product,
            onViewDetails: onViewDetails,
          ),
          ProductReadActionButtons(
            isLive: isLive,
            product: product,
            onDelete: onDelete,
            onEdit: onEdit,
          ),
        ],
      ),
    );
  }
}