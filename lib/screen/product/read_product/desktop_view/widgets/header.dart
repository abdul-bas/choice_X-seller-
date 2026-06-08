 import 'package:choice_x_seller/config/product_table_columns.dart';
import 'package:choice_x_seller/screen/common/texts/text_inter.dart';
import 'package:flutter/material.dart';


class ProductReadTableHeader extends StatelessWidget {
  const ProductReadTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...productTableColumns.map(
            (column) => Expanded(
              flex: column['flex'] as int,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: TextInter(
                  text: column['label'] as String,
                  letterSpacing: 0.5,
                  fontSize: 12,
                  maxLines: 1,
                  overFlow: TextOverflow.ellipsis,
                  wordSpace: 0.5,
                ),
              ),
            ),
          ),
          const SizedBox(width: 0),
        ],
      ),
    );
  }
}