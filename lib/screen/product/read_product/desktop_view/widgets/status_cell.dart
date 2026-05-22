
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/common/texts/text_inter.dart';
import 'package:flutter/material.dart';


class ProductReadStatusCell extends StatelessWidget {
  const ProductReadStatusCell({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: TextInter(
          text: status,
          fontSize: 9,
          color: status == 'Live'
              ? AppColors.success                      
              : AppColors.danger,                   
          letterSpacing: 0.5,
          wordSpace: 0.5,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}