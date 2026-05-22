
import 'package:flutter/material.dart';

class SellerPortalBadge extends StatelessWidget {
  final Color dotColor;
  final Color badgeBg;
  final Color badgeBorder;
  final String label;

  const SellerPortalBadge({super.key, 
    required this.dotColor,
    required this.badgeBg,
    required this.badgeBorder,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      decoration: BoxDecoration(
        color: badgeBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: badgeBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 7),
          Text(
            label,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: dotColor,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
