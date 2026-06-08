
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/seller_registation_page.dart';
import 'package:flutter/material.dart';


class RejectedScreen extends StatelessWidget {
  const RejectedScreen({super.key});

 

  @override
  Widget build(BuildContext context) {
    final width  = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          height: height * 0.8,
          width: width * 0.35,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.grey900,              
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                
                  Container(
                    padding: const EdgeInsets.all(26),
                    decoration: const BoxDecoration(
                      color: AppColors.dangerSubtle,  
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.cancel_rounded,
                      size: 90,
                      color: AppColors.dangerDark,    
                    ),
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    'Application Rejected',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.sellerWhite70,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    'Unfortunately, your seller application could not be approved at this time. '
                    'Please review your submitted details and ensure all required information '
                    'is accurate before reapplying.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.grey700,      
                      height: 1.8,
                    ),
                  ),

                  const SizedBox(height: 50),

                  Column(
                    children: [
                    
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () =>  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => SellerRegistrationPage()),
    ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.dangerDark, 
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                          ),
                          child: const Text(
                            'Reapply',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.sellerWhite70, 
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: AppColors.grey800,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Go Back',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey700, 
                            ),
                          ),
                        ),
                      ),
                    ],
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