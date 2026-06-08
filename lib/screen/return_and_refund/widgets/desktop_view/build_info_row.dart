

  import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class ReturnInfoRow extends StatelessWidget {
  const ReturnInfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.isTablet,
    this.width,
    this.maxLines = 1,
  });

  final String label;
  final String value;
  final bool isTablet;
  final double? width;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            width: width ?? (isTablet ? 80 : 90),
            child: Text(
              label,
              style: TextStyle(
                fontSize: isTablet ? 10 : 11,
                color: AppColors.sellerWhite54,     
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Flexible(
                child: Text(
                  value,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: isTablet ? 10 : 11,
                    color: AppColors.sellerWhite70, 
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }
}