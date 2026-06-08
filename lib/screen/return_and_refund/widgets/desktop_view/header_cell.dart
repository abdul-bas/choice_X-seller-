
  import 'package:choice_x_seller/screen/common/texts/text_inter.dart';
import 'package:flutter/material.dart';

Widget cell(String text, {required int flex, required bool isTablet}) {
    return Expanded(
      flex: flex,
      child: TextInter(
        text: text,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        fontSize: isTablet ? 11 : 13,
      ),
    );
  }
