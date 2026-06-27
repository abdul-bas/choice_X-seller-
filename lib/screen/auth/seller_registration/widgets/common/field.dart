import 'package:choice_x_seller/state/get_x/seller_registration_contorller.dart';
import 'package:choice_x_seller/screen/auth/seller_registration/widgets/common/label.dart';

<<<<<<< HEAD
import 'package:choice_x_seller/screen/product/common/input_fields/input_dec.dart';
=======
import 'package:choice_x_seller/screen/product/create_product/widgets/common/input_dec.dart';
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Field extends StatelessWidget {
  const Field(
      {super.key,
      required this.id,
      required this.label,
      required this.hint,
      required this.icon,
      required this.ctrl,
      this.keyboard,
      this.maxLines = 1,
       this.validator});
  final String id, label, hint;
  final IconData icon;
  final TextEditingController ctrl;
  final TextInputType? keyboard;
  final int maxLines;
 final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<SellerRegCtrl>();
    final fn = FocusNode();
    fn.addListener(() => c.setFocus(id, fn.hasFocus));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SellerRegistationLabel(label),
        const SizedBox(height: 7),
        GetBuilder<SellerRegCtrl>(
          id: 'field_$id',
          builder: (c) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                validator: validator,
                focusNode: fn,
                controller: ctrl,
                keyboardType: keyboard,
                maxLines: maxLines,
                style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFFF2F2FC),
                    fontWeight: FontWeight.w500),
                decoration: inputDec(
                  hint,
                  icon,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
