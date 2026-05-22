import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/get_x/variant_controller.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_icon_button.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildSkuCard(BuildContext context, VariantController ctrl) => Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ctrl.autoSku
            ? AppColors.variantSkuAutoSurface
            : AppColors.variantSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: ctrl.autoSku
              ? AppColors.variantSkuAutoBorder2
              : AppColors.variantBorder,
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          variantPill(
            ctrl.autoSku ? 'AUTO-SKU' : 'MANUAL',
            ctrl.autoSku ? AppColors.white : AppColors.variantLabelMuted,
            icon: ctrl.autoSku
                ? Icons.auto_awesome_rounded
                : Icons.edit_rounded,
          ),
          const Spacer(),
          GestureDetector(
            onTap: ctrl.toggleSku,
            child: Text(
              ctrl.autoSku ? 'Switch to manual' : 'Auto-generate',
              style: const TextStyle(
                fontSize:        11,
                color:           AppColors.variantLabelMuted,
                decoration:      TextDecoration.underline,
                decorationColor: AppColors.variantLabelMuted,
              ),
            ),
          ),
          if (ctrl.autoSku) ...[
            const SizedBox(width: 10),
            variantIconBtn(Icons.refresh_rounded,
                onTap: ctrl.regenerateSku, color: AppColors.white),
          ],
        ]),
        const SizedBox(height: 12),
        TextFormField(
          controller: ctrl.skuCtrl,
          readOnly:   ctrl.autoSku,
          style: TextStyle(
            fontSize:      15,
            fontFamily:    'monospace',
            letterSpacing: 1.5,
            fontWeight:    FontWeight.w700,
            color: ctrl.autoSku
                ? AppColors.white
                : AppColors.variantHeadingText,
          ),
          validator: (v) {
            if (v == null || v.isEmpty) return 'SKU required';
            if (!RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(v))
              return 'Invalid format';
            return null;
          },
          decoration: InputDecoration(
            hintText:  'BLK-128G-4521',
            hintStyle: const TextStyle(
              fontSize:   13,
              color:      AppColors.variantLabelDeep,
              fontFamily: 'monospace',
            ),
            prefixIcon: Icon(
              Icons.qr_code_2_rounded,
              size:  18,
              color: ctrl.autoSku
                  ? AppColors.white
                  : AppColors.variantLabelDeep,
            ),
            suffixIcon: ctrl.autoSku
                ? IconButton(
                    icon: Icon(Icons.copy_rounded,
                        size: 14, color: AppColors.variantSkuCopyIcon),
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: ctrl.skuCtrl.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:         const Text('SKU copied'),
                          duration:        const Duration(seconds: 1),
                          backgroundColor: AppColors.variantSkuCopiedBg,
                          behavior:        SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                  )
                : null,
            filled:    true,
            fillColor: ctrl.autoSku
                ? AppColors.variantSkuAutoSurface
                : AppColors.variantSurfaceDeep,
            isDense:        true,
            contentPadding: const EdgeInsets.symmetric(
                vertical: 14, horizontal: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(
                color: ctrl.autoSku
                    ? AppColors.variantSkuAutoBorder
                    : AppColors.variantBorder,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(
                color: ctrl.autoSku
                    ? AppColors.variantSkuAutoBorder
                    : AppColors.variantBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide:   const BorderSide(color: AppColors.white, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide:   const BorderSide(color: AppColors.danger),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide:
                  const BorderSide(color: AppColors.danger, width: 1.5),
            ),
          ),
        ),
        if (ctrl.autoSku) ...[
          const SizedBox(height: 8),
          const Text(
            'Updates automatically when you pick color & storage',
            style: TextStyle(fontSize: 9.5, color: AppColors.variantLabelDeep),
          ),
        ],
      ]),
    );

