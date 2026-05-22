import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyProductsState extends StatelessWidget {
  const EmptyProductsState({super.key,required this.isMobile});
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        margin: isMobile
                            ? null
                            : const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        padding:
                            isMobile ? null : const EdgeInsets.all(15),
                        decoration: isMobile
                            ? null
                            : BoxDecoration(
                                color: AppColors.sellerSurface,
                                borderRadius: BorderRadius.circular(16),
                              ),
        child: Container(
           padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.sellerSurfaceDeep,
                            borderRadius: BorderRadius.circular(16),
                          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/empty_search.png',
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                const Text(
                  'No Products Available',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.emptyHeading,
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "We're stocking up! Check back soon for new arrivals.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textHint,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
