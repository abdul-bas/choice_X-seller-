import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EmptySearchState extends StatelessWidget {
  const EmptySearchState({
    super.key,
    required this.constraints,
    required this.isMobile,
  });

  final BoxConstraints constraints;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight - 150,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/empty_search.png',
              height: 200,
              width: isMobile ? constraints.maxWidth - 35 : 300,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'No results found',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.emptyHeading,         
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: isMobile ? constraints.maxWidth - 80 : 260,
              child: const Text(
                "Sorry, we couldn't find any product matching your search.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textHint,          
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}