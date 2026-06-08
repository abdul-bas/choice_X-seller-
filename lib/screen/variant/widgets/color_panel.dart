import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/constants/variant_colorsMap.dart';
import 'package:choice_x_seller/core/constants/variant_input_colors.dart';
import 'package:choice_x_seller/screen/variant/widgets/color_badge.dart';
import 'package:choice_x_seller/screen/variant/widgets/no_color_badge.dart';
import 'package:choice_x_seller/state/get_x/variant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ColorPanel extends StatelessWidget {
  const ColorPanel({super.key});

  @override
  Widget build(BuildContext context) =>
      GetBuilder<VariantController>(builder: (ctrl) {
        return Container(
          decoration: BoxDecoration(
            color:        AppColors.variantSurface,
            borderRadius: BorderRadius.circular(16),
            border:       Border.all(color: AppColors.variantBorder),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('COLOR',
                  style: TextStyle(
                    fontSize:      9.5,
                    fontWeight:    FontWeight.w800,
                    color:         AppColors.variantLabelMuted,
                    letterSpacing: 1.5,
                  )),
              const SizedBox(height: 10),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: ctrl.colorIndex != null
                    ? SelectedColorBadge(ctrl: ctrl)
                    : NoColorBadge(),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing:    8,
                    runSpacing: 8,
                    children: variantColors.asMap().entries.map((e) {
                      final isOn = ctrl.colorIndex == e.key;
                      final clr  = variantColorMap[e.value]!;
                      return GestureDetector(
                        onTap: () => ctrl.setColor(e.key),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width:  26,
                          height: 26,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: clr,
                            border: Border.all(
                              color: isOn ? AppColors.white : AppColors.transparent,
                              width: 2.5,
                            ),
                            boxShadow: isOn
                                ? [
                                    BoxShadow(
                                      color:      clr.withValues(alpha:  0.6),
                                      blurRadius: 8,
                                      spreadRadius: 1,
                                    )
                                  ]
                                : [],
                          ),
                          child: isOn
                              ? const Icon(Icons.check_rounded,
                                  size: 13, color: AppColors.white)
                              : null,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
