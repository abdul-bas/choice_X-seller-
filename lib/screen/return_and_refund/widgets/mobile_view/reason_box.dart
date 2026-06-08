import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class ReturnReasonBox extends StatelessWidget {
  const ReturnReasonBox({super.key, required this.reason});

  final String reason;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,              
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.sellerBorder), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'REASON',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: AppColors.returnLabelMuted,     
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            reason,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.returnValueMuted,   
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
