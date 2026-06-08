import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/common/physical_attributes/size_field.dart';
import 'package:choice_x_seller/screen/product/common/physical_attributes/weight_field.dart';
import 'package:flutter/material.dart';

class Physical extends StatelessWidget {
  const Physical(this.c, {super.key, required this.isMobile});

  final AddProductController c;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              weightField(c),
              const SizedBox(height: 16),
              sizeField(c),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: weightField(c)),
              const SizedBox(width: 12),
              Expanded(child: sizeField(c)),
            ],
          );
  }


}
