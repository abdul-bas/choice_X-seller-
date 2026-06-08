
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/common/texts/text_inter.dart';
import 'package:flutter/material.dart';

Widget buildOrderEmptyState(bool isMobile) {
  return Center(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 80 : 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: isMobile ? 64 : 80,
            color: AppColors.white38,
          ),
          const SizedBox(height: 20),
          TextInter(
            text: 'No orders found',
            fontSize: isMobile ? 15 : 18,
            color: AppColors.sellerWhite70,
          ),
        ],
      ),
    ),
  );
}
