import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_icon_button.dart';
import 'package:flutter/material.dart';

Widget buildVariantHeader(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: BoxDecoration(
        color:  AppColors.variantSurface,
        border: const Border(
          bottom: BorderSide(color: AppColors.variantBorder),
        ),
      ),
      child: Row(children: [
        Container(
          width:  38,
          height: 38,
          decoration: BoxDecoration(
            color:        AppColors.brand,
            borderRadius: BorderRadius.circular(11),
          ),
          child: const Icon(Icons.tune_rounded, size: 18, color: AppColors.white),
        ),
        const SizedBox(width: 14),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Configure Variant',
              style: TextStyle(
                fontSize:      16,
                fontWeight:    FontWeight.w700,
                color:         AppColors.variantHeadingText,
                letterSpacing: -0.3,
              )),
          const SizedBox(height: 2),
          Text('Set up images, details, pricing and storage',
              style: TextStyle(fontSize: 11.5, color: AppColors.variantLabelMuted)),
        ]),
        const Spacer(),
        variantIconBtn(Icons.close_rounded, onTap: () => Navigator.pop(context)),
      ]),
    );

