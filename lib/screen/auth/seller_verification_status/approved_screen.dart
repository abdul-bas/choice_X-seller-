
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/layout/dash_board.dart';
import 'package:flutter/material.dart';


class ApprovedScreen extends StatelessWidget {
  const ApprovedScreen({super.key});

  void _navigateToSellerMain(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => SellerMainLayout()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
   
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        if (context.mounted) _navigateToSellerMain(context);
      });
    });

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Card(
            color: AppColors.black,                   
            elevation: 6,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: AppColors.grey900,             
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.successSubtle,  
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle_outline,
                      color: AppColors.success,         
                      size: 64,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Approved',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,           
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Your seller account has been approved.\nYou can now start selling and access all seller features.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: AppColors.sellerWhite70,  
                    ),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.sellerWhite10,   
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.verified_outlined,
                          size: 18,
                          color: AppColors.success,     
                        ),
                        SizedBox(width: 8),
                        Text(
                          'You now have full seller access',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.sellerWhite60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
