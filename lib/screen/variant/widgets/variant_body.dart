import 'package:choice_x_seller/screen/variant/widgets/media_color_row.dart';
import 'package:choice_x_seller/screen/variant/widgets/pricing_row.dart';
import 'package:choice_x_seller/screen/variant/widgets/storage_row.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_deatils_row.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_section_label.dart';
import 'package:flutter/material.dart';

class VariantBody extends StatelessWidget {
  const VariantBody({super.key, required this.context});
  final BuildContext context;

  @override
  Widget build(BuildContext ctx) {
    final isMobile = MediaQuery.of(ctx).size.width < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        variantSectionLabel('Media & Color'),
        const SizedBox(height: 12),
        buildMediaColorRow(),
        const SizedBox(height: 22),
        variantSectionLabel('Product Details'),
        const SizedBox(height: 12),
        buildVariantDetailsRow(ctx),
        const SizedBox(height: 22),
        variantSectionLabel('Pricing'),
        const SizedBox(height: 12),
        buildPricingRow(ctx),
        const SizedBox(height: 22),
        variantSectionLabel('Storage Capacity'),
        const SizedBox(height: 12),
        buildStorageRow(),
        SizedBox(height: isMobile ? 80 : 24),
      ],
    );
  }
}
