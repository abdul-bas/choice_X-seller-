
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/product/common/input_fields/input_dec.dart';
import 'package:flutter/material.dart';

class SellerInputDD extends StatelessWidget {
  const SellerInputDD({
    super.key,
    required this.hint,
    required this.icon,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  });

  final String hint;
  final IconData icon;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) => DropdownButtonFormField<String>(
        validator: validator,
        initialValue: value,
        style: const TextStyle(
            fontSize: 13.5, color: AppColors.white),
        dropdownColor: AppColors.sellerSurface,
        decoration: inputDec(hint, icon),
        isExpanded: true,
        items: items
            .map((v) => DropdownMenuItem(
                  value: v,
                  child: Text(
                    v,
                    style: const TextStyle(
                        fontSize: 13.5,
                        color: AppColors.sellerHeading),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        onChanged: onChanged,
      );
}