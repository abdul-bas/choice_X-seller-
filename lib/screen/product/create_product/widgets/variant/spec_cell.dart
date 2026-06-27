import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Spec extends StatelessWidget {
  const Spec({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.mono = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final bool mono;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: mono ? 10.5 : 12.5,
              fontWeight: FontWeight.w700,
              color: AppColors.sellerHeading,
              fontFamily: mono ? 'monospace' : null,
              letterSpacing: mono ? 0.4 : 0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 9.5,
              color: AppColors.sellerSubtitle,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
}