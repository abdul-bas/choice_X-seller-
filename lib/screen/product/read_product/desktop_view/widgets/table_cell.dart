
import 'package:choice_x_seller/screen/common/texts/text_inter.dart';
import 'package:flutter/material.dart';


class ProductReadTableCell extends StatelessWidget {
  const ProductReadTableCell({
    super.key,
    required this.text,
    required this.flex,
  });

  final String text;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: TextInter(
          text: text,
          letterSpacing: 0.5,
          maxLines: 1,
          fontSize: 10,
          overFlow: TextOverflow.ellipsis,
          wordSpace: 0.5,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}