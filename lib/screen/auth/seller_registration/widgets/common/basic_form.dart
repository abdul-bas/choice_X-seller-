import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/date_picker.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/dropdown.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/field.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/row2.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/section_label.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
class BasicForm extends StatelessWidget {
  const BasicForm({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<SellerRegCtrl>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SellerRegistrationSecLabel('Personal'),
        const SizedBox(height: 12),

        Row2(
          left: Field(
            id: 'ownerName',
            label: 'Owner Name',
            hint: 'Full legal name',
            icon: Icons.person_outline_rounded,
            ctrl: c.ownerName,
            validator: c.basicValidators['ownerName'] as String?Function(String?),
          ),
          right: Field(
            id: 'email',
            label: 'Email Address',
            hint: 'you@example.com',
            icon: Icons.alternate_email_rounded,
            ctrl: c.email,
            keyboard: TextInputType.emailAddress,
            validator: c.basicValidators['email']as String?Function(String?),
          ),
        ),

        const SizedBox(height: 16),

        const SellerRegistrationSecLabel('Business'),
        const SizedBox(height: 12),

        Row2(
          left: SellerRegisterationDropdown(
            id: 'bizType',
            label: 'Business Type',
            hint: 'Select type',
            icon: Icons.business_outlined,
            ctrl: c.bizType,
            options: const [
              'Retail',
              'Wholesale',
              'Manufacturer',
              'Service'
            ],
            validator: c.basicValidators['bizType']as String?Function(String?),
          ),
          right: SellerRegistrationDatePick(
         
            label: 'Date of Birth',
            hint: 'DD / MM / YYYY',
            icon: Icons.cake_outlined,
            ctrl: c.dob,
            validator: c.basicValidators['dob']as String?Function(String?),
          ),
        ),

        const SizedBox(height: 16),

        Field(
          id: 'phone',
          label: 'Phone Number',
          hint: 'Enter your phone number',
          icon: Icons.phone_outlined,
          ctrl: c.phone,
          keyboard: TextInputType.phone,
          validator: c.basicValidators['phone']as String?Function(String?),
        ),
      ],
    );
  }
}