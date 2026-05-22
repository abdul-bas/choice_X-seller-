
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/label.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


class SellerRegisterationDropdown extends StatelessWidget {
  const SellerRegisterationDropdown({
    super.key,
    required this.id,
    required this.label,
    required this.hint,
    required this.icon,
    required this.ctrl,
    required this.options,
    required this.validator,
  });

  final String id;
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController ctrl;
  final List<String> options;
  final String? Function(String?) validator;

  static const Color _dropdownBg = Color(0xFF13132A); 

  @override
  Widget build(BuildContext context) {
    final c = Get.find<SellerRegCtrl>();
    final initial = options.contains(ctrl.text) ? ctrl.text : null;
    c.dropState(id, initial);

    return FormField<String>(
      initialValue: ctrl.text.isNotEmpty ? ctrl.text : null,
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SellerRegistationLabel(label),
            const SizedBox(height: 7),
            GetBuilder<SellerRegCtrl>(
              id: 'drop_$id',
              builder: (_) {
                final raw = c.dropState(id, initial).value;
                final String? val =
                    (raw != null && options.contains(raw)) ? raw : null;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: AppColors.sellerSurface, 
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: field.hasError
                              ? AppColors.danger        
                              : AppColors.sellerBorder, 
                          width: field.hasError ? 1.5 : 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: val,
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Icon(icon, size: 15,
                                  color: AppColors.sellerWhite70), 
                              const SizedBox(width: 10),
                              Text(
                                hint,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.sellerWhite70, 
                                ),
                              ),
                            ],
                          ),
                          icon: const Icon(
                            Icons.expand_more_rounded,
                            color: AppColors.sellerWhite70, 
                            size: 18,
                          ),
                          dropdownColor: _dropdownBg,   
                          items: options
                              .map(
                                (o) => DropdownMenuItem(
                                  value: o,
                                  child: Text(
                                    o,
                                    style: const TextStyle(
                                      color: AppColors.white, 
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (v) {
                            field.didChange(v);
                            c.setDropValue(id, v, ctrl);
                          },
                        ),
                      ),
                    ),
                    if (field.hasError)
                      Padding(
                        padding: const EdgeInsets.only(top: 6, left: 2),
                        child: Text(
                          field.errorText!,
                          style: const TextStyle(
                            color: AppColors.danger,    
                            fontSize: 11,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}