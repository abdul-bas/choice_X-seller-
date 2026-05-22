import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/controller/controller.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/seller_field_decoration.dart';
import 'package:choice_x_seller/state/get_x/obscure.dart';
import 'package:choice_x_seller/core/utils/navigation/push.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/forgot_password_screen.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/label.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

Widget sellerAccessFormBody(
  BuildContext context,
  TextEditingController email0,
  TextEditingController password0,
  GlobalKey<FormState> formKey,
  Obscure obscure,
  bool isTab,
) {
  return Obx(
    () => Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Text(
            'Sign in',
            style: TextStyle(
              fontSize: isTab ? 28 : 24,
              fontWeight: FontWeight.w900,
              color: AppColors.white,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Enter your credentials to continue',
            style: TextStyle(
              fontSize: isTab ? 13 : 12,
              color: AppColors.white.withValues(alpha: 0.35),
            ),
          ),
          SizedBox(height: isTab ? 32 : 28),

         
          sellerAccessLabel('Email Address', isTab ? 12 : 11),
          const SizedBox(height: 8),
          TextFormField(
            controller: email0,
            keyboardType: TextInputType.emailAddress,
            validator:AuthController. validateSellerEmail,
            style: GoogleFonts.robotoSlab(
              color: AppColors.white,
              fontSize: isTab ? 13 : 11,
            ),
            decoration: buildSellerFieldDecoration(
              hint: 'you@example.com',
              prefix: Icon(Icons.email_outlined, size: isTab ? 20 : 18),
            ),
          ),
          SizedBox(height: isTab ? 22 : 18),

        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              sellerAccessLabel('Password', isTab ? 12 : 11),
              GestureDetector(
                onTap: () => push(context, ForgotPasswordScreen()),
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    fontSize: isTab ? 12 : 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.brand,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: password0,
            obscureText: obscure.password.value,
            validator:AuthController. validateSellerPassword,
            style: GoogleFonts.robotoSlab(
              color: AppColors.white,
              fontSize: isTab ? 13 : 11,
            ),
            decoration: buildSellerFieldDecoration(
              hint: 'Enter your password',
              prefix: Icon(Icons.lock_outline_rounded, size: isTab ? 20 : 18),
              suffix: IconButton(
                onPressed: obscure.passwordValueChang,
                icon: Icon(
                  obscure.password.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: isTab ? 20 : 18,
                  color: AppColors.white.withValues(alpha: 0.6),
                ),
              ),
            ),
          ),
          SizedBox(height: isTab ? 32 : 28),

          
          SizedBox(
            height: isTab ? 52 : 44,
            child: AuthButton(
              color: AppColors.brandGradient1,
              width: double.infinity,
              text: 'Sign In',
              function: () =>AuthController. submitSellerSignIn(
                formKey: formKey,
                email: email0.text.trim(),
                password: password0.text.trim(),
                context: context,
              ),
            ),
          ),
          const SizedBox(height: 24),

       
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.lock_rounded,
                  size: isTab ? 13 : 11,
                  color: AppColors.white.withValues(alpha: 0.22),
                ),
                const SizedBox(width: 5),
                Text(
                  'End-to-end encrypted',
                  style: TextStyle(
                    fontSize: isTab ? 11 : 10,
                    color: AppColors.white.withValues(alpha: 0.22),
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}