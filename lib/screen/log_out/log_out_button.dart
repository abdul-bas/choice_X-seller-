


import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/log_out/listener/log_out_listener.dart';
import 'package:flutter/material.dart';




class LogOut extends StatelessWidget {
  const LogOut({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return authLogoutListener(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        
          Container(height: 1, color: AppColors.sellerBorder),
      
         
          Material(
            color: AppColors.transparent,
            child: InkWell(
              onTap: onTap,
              splashColor:    AppColors.danger.withValues(alpha: 0.10),
              highlightColor: AppColors.danger.withValues(alpha: 0.06),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  children: const [
                    Icon(
                      Icons.logout_rounded,
                      size: 17,
                      color: AppColors.grey600,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: AppColors.textSubdued,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 11,
                      color: AppColors.iconDark,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}