
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildOrderDetailsHeader(bool isTablet) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.sellerSurface,
          AppColors.black54,
          AppColors.sellerSurface,
          AppColors.black26,
        ],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 12 : 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Ordered Item',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: isTablet ? 11 : 12,
                color: AppColors.white,
              ),
            ),
          ),
          const Expanded(flex: 2, child: SizedBox()),
          const Expanded(flex: 2, child: SizedBox()),
          Expanded(
            flex: 2,
            child: Text(
              'Order Details',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: isTablet ? 11 : 12,
                color: AppColors.white,
              ),
            ),
          ),
          const Expanded(flex: 2, child: SizedBox()),
          SizedBox(width: isTablet ? 110 : 130, child: const SizedBox()),
        ],
      ),
    ),
  );
}
