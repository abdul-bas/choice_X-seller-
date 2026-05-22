
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SellerDateTap extends StatelessWidget {
  const SellerDateTap({
    super.key,
    required this.value,
    required this.hint,
    required this.icon,
    required this.onTap,
  });

  final String value;
  final String hint;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.sellerSurface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.sellerBorder),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Icon(icon, size: 18, color: AppColors.sellerWhite70),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  value.isEmpty ? hint : value,
                  style: TextStyle(
                    fontSize: 13,
                    color: value.isEmpty
                        ? AppColors.sellerWhite70
                        : AppColors.sellerHeading,
                  ),
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_rounded,
                  size: 20, color: AppColors.sellerWhite70),
            ],
          ),
        ),
      );
}
