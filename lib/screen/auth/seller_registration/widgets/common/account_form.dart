import 'package:choice_x_seller/core/constants/app_color.dart';
import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/field.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/passowrd_hint.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/password_field.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/row2.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/section_label.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
class AccountForm extends StatelessWidget {
  const AccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<SellerRegCtrl>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: brandColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: brandColor.withValues(alpha: 0.20)),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: brandColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: brandColor.withValues(alpha: 0.3)),
                ),
                child: Icon(
                  Icons.verified_user_outlined,
                  color: brandColor,
                  size: 17,
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Text(
                  'Your password is encrypted end-to-end.\nWe never store it in plain text.',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9898B8),
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 22),

        const SellerRegistrationSecLabel('Credentials'),
        const SizedBox(height: 12),

        Field(
          id: 'username',
          label: 'Username',
          hint: 'Create a unique username',
          icon: Icons.badge_outlined,
          ctrl: c.username,
          validator: c.accountValidators['username'],
        ),

        const SizedBox(height: 16),

        Row2(
          left: SellerRegistrationPasswordField(
            id: 'password',
            label: 'Password',
            hint: 'Create strong password',
            ctrl: c.password,
            validator: c.accountValidators['password'],
          ),

          right: SellerRegistrationPasswordField(
            id: 'confirmPass',
            label: 'Confirm Password',
            hint: 'Repeat your password',
            ctrl: c.confirmPass,
            validator: c.accountValidators['confirmPass'],
          ),
        ),

        const SizedBox(height: 20),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            PasswordHint('8+ characters'),
            PasswordHint('Uppercase letter'),
            PasswordHint('Number or symbol'),
          ],
        ),
      ],
    );
  }
}