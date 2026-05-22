import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/label.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/input_dec.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SellerRegistrationPasswordField extends StatelessWidget {
  const SellerRegistrationPasswordField({
    super.key,
    required this.id,
    required this.label,
    required this.hint,
    required this.ctrl,
    this.validator,
  });

  final String id;
  final String label;
  final String hint;
  final TextEditingController ctrl;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final c  = Get.find<SellerRegCtrl>();
    final fn = FocusNode();
    fn.addListener(() => c.setPwdFocus(id, fn.hasFocus));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SellerRegistationLabel(label),
        const SizedBox(height: 7),
        GetBuilder<SellerRegCtrl>(
          id: 'pwd_$id',
          builder: (c) {
            final st = c.pwdState(id);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: st.focused
                    ? [
                        BoxShadow(
                          color: AppColors.sellerPasswordIcon
                              .withValues(alpha: 0.22), 
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: TextFormField(
                focusNode: fn,
                controller: ctrl,
                validator: validator,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.sellerHeading,       
                  fontWeight: FontWeight.w500,
                ),
                decoration: inputDec(hint, Icons.lock_outline_rounded).copyWith(
                  suffixIcon: GestureDetector(
                    onTap: () => c.togglePwdVisibility(id),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Icon(
                        st.hidden
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 16,
                        color: st.focused
                            ? AppColors.sellerPasswordIcon 
                            : AppColors.sellerSubtitle,   
                      ),
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 48,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}