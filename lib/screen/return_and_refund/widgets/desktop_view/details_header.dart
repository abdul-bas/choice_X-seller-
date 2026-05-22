
  
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class ReturnDetailsHeader extends StatelessWidget {
  const ReturnDetailsHeader({super.key, required this.isTablet});

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.sellerSurface,                 
            AppColors.black54,                       
            AppColors.sellerSurface,
            AppColors.black26,                        
          ],
          stops: [0.0, 0.3, 0.6, 1.0],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 12 : 16,
          vertical: 10,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Text(
                'Request Details',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: isTablet ? 11 : 12,
                  color: AppColors.white,           
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                'User Info',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: isTablet ? 11 : 12,
                  color: AppColors.white,             
                ),
              ),
            ),
            SizedBox(width: isTablet ? 110 : 130),
          ],
        ),
      ),
    );
  }
}