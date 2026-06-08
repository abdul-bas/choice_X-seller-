import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VariantPicker extends StatelessWidget {
  final List<dynamic> variants;
  final ValueNotifier<int> variantIndex;

  const VariantPicker({
    super.key,
    required this.variants,
    required this.variantIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: variants.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              variantIndex.value = i;
              variantIndex.notifyListeners();
            },
            child: ValueListenableBuilder<int>(
              valueListenable: variantIndex,
              builder: (context, index, _) {
                final isSelected = i == index;
                final variantColor = variants[i]['color']?.toString() ?? 'N/A';

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isSelected
                        ? AppColors.sellerAccent
                        : AppColors.sellerSurface,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.sellerAccent
                          : AppColors.sellerBorder,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    variantColor,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: isSelected
                          ? AppColors.white
                          : AppColors.sellerBodyText,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
