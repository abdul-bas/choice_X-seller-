
import 'package:choice_x_seller/screen/common/texts/text_inter.dart';
import 'package:flutter/material.dart';

Widget buildOrderHeaderRow(bool isTablet) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 12 : 16, vertical: 12),
    child: Row(
      children: [
        Expanded(
            flex: 2,
            child: TextInter(
                text: 'Order ID',
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
                fontSize: isTablet ? 11 : 13)),
        Expanded(
            flex: 2,
            child: TextInter(
                text: 'Customer Name',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontSize: isTablet ? 11 : 13)),
        Expanded(
            flex: 2,
            child: TextInter(
                text: 'Status',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontSize: isTablet ? 11 : 13)),
        Expanded(
            flex: 2,
            child: TextInter(
                text: 'Payment Status',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontSize: isTablet ? 11 : 13)),
        Expanded(
            flex: 2,
            child: TextInter(
                text: 'Total',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontSize: isTablet ? 11 : 13)),
        SizedBox(
          width: isTablet ? 110 : 130,
          child: TextInter(
              text: 'Change Status',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              fontSize: isTablet ? 11 : 13),
        ),
      ],
    ),
  );
}