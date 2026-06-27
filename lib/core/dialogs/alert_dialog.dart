import 'package:choice_x_seller/config/alert_config.dart';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.config});

  final AlertDialogConfig config;

    

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28,),
      child: ConstrainedBox(constraints: BoxConstraints(maxWidth:600),
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          decoration: BoxDecoration(
            color: AppColors.sellerSurface,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(color: config.confirmColor.withValues(alpha: 0.18), blurRadius: 40, offset: const Offset(0, 12)),
              BoxShadow(color: AppColors.shadowDialog, blurRadius: 12, offset: const Offset(0, 4)),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
          
             
              
            
              Container(
                width: 72, height: 72,
                decoration: BoxDecoration(
                  color: config.iconColor.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                  border: Border.all(color: config.iconColor.withValues(alpha: 0.20), width: 2),
                ),
                child: Icon(config.icon, color: config.iconColor, size: 34),
              ),
              const SizedBox(height: 18),
              
         
              Text(config.title, textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700,
                    letterSpacing: -0.2, color: AppColors.sellerHeading),
              ),
              const SizedBox(height: 8),
              
             
              Text(config.content, textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: AppColors.sellerBodyText, height: 1.5),
              ),
              const SizedBox(height: 24),
              
              
              Row(
                children: [
                  if (config.showCancelButton) ...[
                    Expanded(
                      child: SizedBox(height: 48,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.sellerStepInactive,
                            foregroundColor: AppColors.sellerBodyText,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          child: Text(config.cancelText, style: const TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: SizedBox(height: 48,
                      child: ElevatedButton(
                        onPressed: () { Navigator.pop(context); config.onConfirm(); },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: config.confirmColor,
                          foregroundColor: AppColors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: Text(config.confirmText, style: const TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
