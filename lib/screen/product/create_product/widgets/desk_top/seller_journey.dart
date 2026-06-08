
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/desk_top/step_dotes.dart';
import 'package:flutter/material.dart';

class SellerJourney extends StatelessWidget {
  const SellerJourney({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(ProductLogic. sellerJourney.length, (i) {
        final (icon, title, desc) =ProductLogic.sellerJourney [i];
        final isLast = i == ProductLogic.sellerJourney .length - 1;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            SizedBox(
              width: 32,
              child: Column(
                children: [
                  StepDot(icon),
                  if (!isLast)
                    Container(
                      width: 1.5,
                      height: 36,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0x882DD4BF),
                            Color(0x002DD4BF),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            // Text
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : 16, top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSoft)),
                    const SizedBox(height: 3),
                    Text(desc,
                        style: const TextStyle(
                            fontSize: 11.5,
                            color: AppColors.lavender,
                            height: 1.5)),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
