import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:flutter/material.dart';
class ExtraFeatures extends StatelessWidget {
  const ExtraFeatures({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: ProductLogic.productAddingItems
          .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.tealLight.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(item.$1, size: 16, color: AppColors.tealLight),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.$2,
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.textSoft, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}