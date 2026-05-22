
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/constants/step_labels.dart';
import 'package:flutter/material.dart';

List<Widget> buildProductAddingSteps() {
  return productAddingStepLabels.asMap().entries.map((e) {
    final i      = e.key;
    final num    = e.value.$1;
    final label  = e.value.$2;
    final done   = i < 3;
    final active = i == 3;
    final isLast = i == productAddingStepLabels.length - 1;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: done
                    ? AppColors.sellerAccentGreen
                    : active
                        ? AppColors.sellerBorder
                        : AppColors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: done
                      ? AppColors.sellerAccentGreen
                      : active
                          ? AppColors.sellerBodyText
                          : AppColors.sellerBorder,
                  width: done ? 0 : 1.5,
                ),
              ),
              child: Center(
                child: done
                    ? const Icon(Icons.check_rounded,
                        size: 13, color: AppColors.sellerSurfaceDeep)
                    : Text(
                        num,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          color: active
                              ? AppColors.sellerHeading
                              : AppColors.sellerBodyText,
                        ),
                      ),
              ),
            ),
            if (!isLast)
              Container(
                width: 1,
                height: 22,
                color: done
                    ? AppColors.sellerAccentGreen.withValues(alpha: 0.25)
                    : AppColors.sellerBorder,
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight:
                    active ? FontWeight.w700 : FontWeight.w400,
                color: done || active
                    ? AppColors.sellerHeading
                    : AppColors.sellerBodyText,
              ),
            ),
          ),
        ),
      ],
    );
  }).toList();
}
