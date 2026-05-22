

import 'package:choice_x_seller/models/seller_registration_step_model/step_model.dart';
import 'package:flutter/material.dart';

const sellerRegistrationSteps = [
  SellerRegistrationStepModel('basic',   'Business Info',  'Tell us about your business',  Icons.storefront_outlined,  '01'),
  SellerRegistrationStepModel('address', 'Address',        'Where is your store located?', Icons.location_on_outlined, '02'),
  SellerRegistrationStepModel('account', 'Account Setup',  'Secure your seller account',   Icons.shield_outlined,      '03'),
];