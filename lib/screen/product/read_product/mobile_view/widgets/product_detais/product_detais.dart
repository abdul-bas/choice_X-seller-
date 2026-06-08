import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/screen/product/read_product/mobile_view/widgets/product_detais/detais_row.dart';
import 'package:choice_x_seller/screen/product/read_product/mobile_view/widgets/product_detais/section_header.dart';
import 'package:flutter/material.dart';


class ProductReadDetails extends StatelessWidget {
  const ProductReadDetails({
    super.key,
    required this.product,
    this.onViewDetails,
  });

  final ProductModel product;
  final VoidCallback? onViewDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductReadSectionHeader(onViewDetails: onViewDetails),
          const SizedBox(height: 16),
          DetailRow(icon: Icons.devices_rounded,          label: 'Model',        value: product.model),
          const SizedBox(height: 12),
          DetailRow(icon: Icons.category_rounded,         label: 'Product Type', value: product.productType),
          const SizedBox(height: 12),
          DetailRow(icon: Icons.verified_user_rounded,    label: 'Warranty',     value: product.warranty),
          const SizedBox(height: 12),
          DetailRow(icon: Icons.monitor_weight_rounded,   label: 'Weight',       value: product.weight ?? ''),
          const SizedBox(height: 12),
          DetailRow(icon: Icons.straighten_rounded,       label: 'Size',         value: product.size),
          const SizedBox(height: 12),
          DetailRow(icon: Icons.grid_view_rounded,        label: 'Category',     value: product.category),
          const SizedBox(height: 12),
          DetailRow(icon: Icons.branding_watermark_rounded, label: 'Brand',      value: product.brand),
        ],
      ),
    );
  }
}
