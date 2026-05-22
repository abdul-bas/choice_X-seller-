
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/common/texts/text_inter.dart';
import 'package:flutter/material.dart';


class ReturnEmptyState extends StatelessWidget {
  const ReturnEmptyState({super.key, required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: isMobile ? 80 : 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.assignment_return_outlined,
              size: isMobile ? 64 : 80,
              color: AppColors.white38,             
            ),
            const SizedBox(height: 20),
            TextInter(
              text: 'No return requests found',
              fontSize: isMobile ? 15 : 18,
              color: AppColors.sellerWhite70,      
            ),
          ],
        ),
      ),
    );
  }
}