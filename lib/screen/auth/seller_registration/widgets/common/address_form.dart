
import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/dropdown.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/field.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/row2.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/section_label.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
class AddressForm extends StatelessWidget {
  const AddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<SellerRegCtrl>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SellerRegistrationSecLabel('Location'),
        const SizedBox(height: 12),

        Field(
          id: 'street',
          label: 'Street Address',
          hint: 'House no, street name',
          icon: Icons.home_outlined,
          ctrl: c.street,
          maxLines: 2,
          validator: c.addressValidators['street'],
        ),

        const SizedBox(height: 16),

        Row2(
          left: Field(
            id: 'city',
            label: 'City',
            hint: 'Enter city',
            icon: Icons.location_city_outlined,
            ctrl: c.city,
            validator: c.addressValidators['city'],
          ),

          right: SellerRegisterationDropdown(
            id: 'addrState',
            label: 'State',
            hint: 'Select state',
            icon: Icons.map_outlined,
            ctrl: c.state,
            options: const [
              'Kerala',
              'Tamil Nadu',
              'Karnataka',
              'Telangana',
              'Maharashtra'
            ],
            validator: c.addressValidators['state'] as String? Function(String?),
          ),
        ),

        const SizedBox(height: 16),

        Row2(
          left: SellerRegisterationDropdown(
            id: 'country',
            label: 'Country',
            hint: 'Select country',
            icon: Icons.public_outlined,
            ctrl: c.country,
            options: const ['India'],
            validator: c.addressValidators['country']as String? Function(String?),
          ),

          right: Field(
            id: 'zip',
            label: 'Zip Code',
            hint: 'Enter pincode',
            icon: Icons.local_post_office_outlined,
            ctrl: c.zip,
            keyboard: TextInputType.number,
            validator: c.addressValidators['zip'],
          ),
        ),

        const SizedBox(height: 16),

        const SellerRegistrationSecLabel('Contact'),
        const SizedBox(height: 12),

        Row2(
          left: Field(
            id: 'regPhone',
            label: 'Reg. Phone',
            hint: 'Registered phone',
            icon: Icons.phone_outlined,
            ctrl: c.regPhone,
            keyboard: TextInputType.phone,
            validator: c.addressValidators['regPhone'],
          ),

          right: Field(
            
            id: 'landmark',
            label: 'Landmark',
            hint: 'Nearby landmark (optional)',
            icon: Icons.place_outlined,
            ctrl: c.landmark,
            
          ),
        ),
      ],
    );
  }
}