
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/label.dart';
import 'package:flutter/material.dart';


class SellerRegistrationDatePick extends StatelessWidget {
  const SellerRegistrationDatePick({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.ctrl,
    required this.validator,
  });

  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController ctrl;
  final String? Function(String?) validator;

  
  static const Color _pickerPrimary = Color(0xFF7C5CFC); 
  static const Color _pickerSurface = Color(0xFF1A1A2E);
  static const Color _pickerBg     = Color(0xFF0F0F1E);

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: ctrl.text,
      validator: validator,
      builder: (field) {
        return ValueListenableBuilder<TextEditingValue>(
          valueListenable: ctrl,
          builder: (_, v, __) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (field.value != v.text) field.didChange(v.text);
            });

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SellerRegistationLabel(label),
                const SizedBox(height: 7),
                GestureDetector(
                  onTap: () async {
                    final p = await showDatePicker(
                      context: context,
                      initialDate: DateTime(1995),
                      firstDate: DateTime(1940),
                      lastDate: DateTime.now()
                          .subtract(const Duration(days: 365 * 18)),
                      builder: (ctx, child) => Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme: const ColorScheme.dark(
                            primary: _pickerPrimary,
                            surface: _pickerSurface,
                          ),
                          dialogBackgroundColor: _pickerBg,
                        ),
                        child: child!,
                      ),
                    );

                    if (p != null) {
                      ctrl.text =
                          '${p.day.toString().padLeft(2, '0')}/'
                          '${p.month.toString().padLeft(2, '0')}/'
                          '${p.year}';
                      field.didChange(ctrl.text);
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    height: 48,
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
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: [
                        Icon(icon, size: 15,
                            color: AppColors.sellerWhite70), 
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            v.text.isEmpty ? hint : v.text,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: v.text.isEmpty
                                  ? AppColors.sellerWhite70
                                  : AppColors.sellerHeading,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.expand_more_rounded,
                          color: AppColors.sellerWhite70, 
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                if (field.errorText != null)
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
        );
      },
    );
  }
}
