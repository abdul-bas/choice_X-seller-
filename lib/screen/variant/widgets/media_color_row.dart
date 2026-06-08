 import 'package:choice_x_seller/screen/variant/widgets/color_panel.dart';
import 'package:choice_x_seller/screen/variant/widgets/image_panel.dart';
import 'package:flutter/material.dart';

Widget buildMediaColorRow() => const SizedBox(
      height: 250,
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(flex: 5, child: ImagePanel()),
        SizedBox(width: 12),
        Expanded(flex: 4, child: ColorPanel()),
      ]),
    );
