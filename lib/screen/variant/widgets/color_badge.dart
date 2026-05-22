
import 'package:choice_x_seller/core/constants/variant_colorsMap.dart';
import 'package:choice_x_seller/core/constants/variant_input_colors.dart';
import 'package:choice_x_seller/state/get_x/variant_controller.dart';
import 'package:flutter/material.dart';

class SelectedColorBadge extends StatelessWidget {
  const SelectedColorBadge({super.key, required this.ctrl});
  final VariantController ctrl;

  @override
  Widget build(BuildContext context) {
    final clr = variantColorMap[variantColors[ctrl.colorIndex!]]!;
    return Container(
      key:     ValueKey(ctrl.colorIndex),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color:        clr.withValues(alpha:  0.1),
        borderRadius: BorderRadius.circular(8),
        border:       Border.all(color: clr.withValues(alpha:  0.3)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width:  9,
          height: 9,
          decoration: BoxDecoration(shape: BoxShape.circle, color: clr),
        ),
        const SizedBox(width: 6),
        Text(variantColors[ctrl.colorIndex!],
            style: TextStyle(
              fontSize:   12,
              fontWeight: FontWeight.w600,
              color:      clr,
            )),
      ]),
    );
  }
}