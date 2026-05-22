import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key, required this.state});

  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.black,
      elevation: 0,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 1.5,
            color: AppColors.white.withValues(alpha: 0.10),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.50),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                      
                        color: state.iconColor.withValues(alpha: 0.30),
                        width: 2,
                      ),
                    ),
                    child: Icon(state.icon,
                        color: state.iconColor, size: 36),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    state.title,
                    style: TextStyle(
                      color: state.iconColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

          
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.transparent,
                    AppColors.white.withValues(alpha: 0.10),
                    AppColors.transparent,
                  ],
                ),
              ),
            ),

    
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                state.message,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.grey300,
                  height: 1.6,
                  letterSpacing: 0.3,
                ),
                textAlign: TextAlign.center,
              ),
            ),

           
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (state.pop != null) Navigator.of(context).pop();
                    if (state.replace != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => state.replace!),
                      );
                    }
                    if (state.removeAllUntil != null) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (_) => state.removeAllUntil!),
                        (_) => false,
                      );
                    }
                    if (state.popUntil != null) {
                      Navigator.popUntil(
                        context,
                        (route) =>
                            route.settings.name == state.popUntil,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                   
                    backgroundColor: state.iconColor,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shadowColor: state.iconColor.withValues(alpha: 0.50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    state.buttonText,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}