
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/common/texts/text_slab.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/header/shared_chip.dart';
import 'package:flutter/material.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(
                  Icons.menu_rounded,
                  size: 25,
                  color: AppColors.sellerHeading,
                ),
              ),
              const SizedBox(width: 15),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 5,
                    height: 5,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.sellerAccentGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'NEW LISTING',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      color: AppColors.sellerAccentGreen,
                      letterSpacing: 2.4,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          TextSlab(
            text: 'Add New\nProduct',
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: AppColors.sellerHeading,
            letterSpacing: -0.5,
          ),
          const SizedBox(height: 10),
          const Text(
            'Complete every section carefully. '
            'Your product goes live the moment you hit Publish.',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.sellerBodyText,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 20),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SharedChip(icon: Icons.grid_view_rounded, label: '8 sections'),
              SharedChip(icon: Icons.bolt_rounded, label: 'Instant publish'),
              SharedChip(icon: Icons.drafts_outlined, label: 'Draft saved'),
            ],
          ),
        ],
      ),
    );
  }
}