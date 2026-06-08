import 'package:choice_x_seller/screen/common/texts/text_inter.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/desktop_view/header_cell.dart';
import 'package:flutter/material.dart';

class ReturnHeaderRow extends StatelessWidget {
  const ReturnHeaderRow({super.key, required this.isTablet});

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 12 : 16,
        vertical: 12,
      ),
      child: Row(
        children: [
          cell('Request ID', flex: 2, isTablet: isTablet),
          cell('Order ID', flex: 2, isTablet: isTablet),
          cell('Type', flex: 2, isTablet: isTablet),
          cell('Status', flex: 2, isTablet: isTablet),
          cell('Payment ID', flex: 2, isTablet: isTablet),
          SizedBox(
            width: isTablet ? 110 : 130,
            child: TextInter(
              text: 'Change Status',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              fontSize: isTablet ? 11 : 13,
            ),
          ),
        ],
      ),
    );
  }
}
