import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/constants/variant_colorsMap.dart';
import 'package:choice_x_seller/models/variant_model/variant_model.dart';
import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/common/variant/btn.dart';
import 'package:choice_x_seller/screen/product/common/variant/image_grid.dart';
import 'package:choice_x_seller/screen/product/common/variant/spec_cell.dart';
import 'package:choice_x_seller/screen/product/common/variant/variant_card_divider.dart';
import 'package:choice_x_seller/screen/variant/edit_screen.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class VariantCard extends StatelessWidget {
  const VariantCard({
    super.key,
    required this.variant,
    required this.controller,
    required this.index,
  });

  final VariantModel variant;
  final AddProductController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    final rawPrice = double.tryParse(variant.price) ?? 0;
    final disc = double.tryParse(variant.discount) ?? 0;
    final hasDisc = disc > 0;
    final effPrice = ProductLogic.effectivePrice(rawPrice, disc);

    final Color? color = variantColorMap[variant.color];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.sellerBorder),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.60),
            blurRadius: 28,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: AppColors.addressCheckTick.withValues(alpha: 0.05),
            blurRadius: 60,
            spreadRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageGrid(images: variant.images),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Color chip
                      Container(
                        padding: const EdgeInsets.fromLTRB(8, 5, 12, 5),
                        decoration: BoxDecoration(
                          color: AppColors.sellerSurface,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.sellerBorder),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color,
                                boxShadow: [
                                  BoxShadow(
                                    color: color ??
                                        AppColors.white.withValues(alpha: 0.60),
                                    blurRadius: 6,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 7),
                            Text(
                              variant.color.isEmpty
                                  ? 'No color'
                                  : variant.color,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.sellerHeading,
                              ),
                            ),
                          ],
                        ),
                      ),

                      if (variant.storage.isNotEmpty &&
                          variant.storage != 'None') ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.brandSubtle,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppColors.brandLogoGradient1
                                  .withValues(alpha: 0.30),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.storage_rounded,
                                  size: 11,
                                  color: AppColors.brandLogoGradient1),
                              const SizedBox(width: 5),
                              Text(
                                variant.storage,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.brandLogoGradient1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      const Spacer(),

                      // Edit button
                      Btn(
                        icon: Icons.edit_outlined,
                        color: AppColors.sellerSubtitle,
                        onTap: () async {
                          final result = await showDialog(
                            context: context,
                            builder: (context) =>
                                EditVariantScreen(variant: variant),
                          );
                          if (result != null) {
                            Get.find<AddProductController>()
                                .updateVariant(result, index);
                          }
                        },
                      ),
                      const SizedBox(width: 6),

                      // Delete button
                      Btn(
                        icon: Icons.delete_outline_rounded,
                        color: AppColors.danger,
                        onTap: () => controller.variants.removeAt(index),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        rawPrice == 0
                            ? '—'
                            : '₹${ProductLogic.fmtPrice(effPrice)}',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: AppColors.sellerHeading,
                          height: 1,
                        ),
                      ),
                      if (hasDisc && rawPrice > 0) ...[
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.warningLight,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: AppColors.warningIcon
                                      .withValues(alpha: 0.35),
                                ),
                              ),
                              child: Text(
                                '${disc.round()}% OFF',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.warningIcon,
                                ),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '₹${ProductLogic.fmtPrice(rawPrice)}',
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.sellerStepInactive,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.sellerStepInactive,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 14),
                  Container(height: 1, color: AppColors.sellerBorder),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Spec(
                          icon: Icons.qr_code_2_rounded,
                          label: 'SKU',
                          value: variant.sku.isEmpty ? '—' : variant.sku,
                          color: AppColors.notificationUnreadBg,
                          mono: true,
                        ),
                      ),
                      variantCardDivider(),
                      Expanded(
                        child: Spec(
                          icon: Icons.inventory_2_outlined,
                          label: 'Stock',
                          value: variant.qty.isEmpty ? '—' : variant.qty,
                          color: AppColors.sellerAccentGreen,
                        ),
                      ),
                      variantCardDivider(),
                      Expanded(
                        child: Spec(
                          icon: Icons.bolt_rounded,
                          label: 'Power',
                          value: variant.power.isEmpty ? '—' : variant.power,
                          color: AppColors.warningIcon,
                        ),
                      ),
                      variantCardDivider(),
                      Expanded(
                        child: Spec(
                          icon: Icons.storage_rounded,
                          label: 'Storage',
                          value: (variant.storage.isEmpty ||
                                  variant.storage == 'None')
                              ? '—'
                              : variant.storage,
                          color: AppColors.brandLogoGradient1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
