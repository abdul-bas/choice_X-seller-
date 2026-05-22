
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/constants/month.dart';
import 'package:choice_x_seller/core/utils/helpers/formate_number.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget bottomTitleWidget(double value, TitleMeta meta, int monthCount) {
  final index = value.toInt();
  if (index < 0 || index >= monthCount) return const SizedBox();

  final currentMonthIndex = DateTime.now().month - 1;
 
  final shiftedIndex =
      ((currentMonthIndex - (monthCount - 1) + index) % 12 + 12) % 12;

  return SideTitleWidget(
    meta: meta,
    space: 10,
    child: Text(
      months[shiftedIndex],
      style: const TextStyle(
        color: AppColors.chartAxisLabel,            
        fontWeight: FontWeight.bold,
        fontSize: 11,
      ),
    ),
  );
}

/// Left axis label.
Widget leftTitleWidget(double value, TitleMeta meta) {
  if (value == meta.max || value == 0) return const SizedBox();
  return SideTitleWidget(
    meta: meta,
    space: 6,
    child: Text(
      formatNumber(value),
      style: const TextStyle(
        color: AppColors.chartAxisLabelAlt,
        fontWeight: FontWeight.bold,
        fontSize: 11,
      ),
      textAlign: TextAlign.right,
    ),
  );
}