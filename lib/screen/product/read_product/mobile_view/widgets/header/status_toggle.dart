
  import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class ProductReadStatusToggle extends StatelessWidget {
  const ProductReadStatusToggle({
    super.key,
    required this.isLive,
    required this.onToggleStatus,
  });

  final bool isLive;
  final VoidCallback? onToggleStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isLive ? 'Live' : 'In Active',
          style: TextStyle(
            color: isLive
                ? AppColors.successText                
                : AppColors.dangerMid,                
            fontSize: 13,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onToggleStatus ?? () {},
          child: Container(
            width: 45,
            height: 25,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.sellerWhite24), 
            ),
            child: Align(
              alignment:
                  isLive ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isLive
                      ? AppColors.sellerWhite70         
                      : AppColors.sellerWhite24,       
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}