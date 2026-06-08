
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget leftTitleWidgets(
  double value,
  TitleMeta meta,
  String Function(double) formatter,
) {
  if (value == meta.max) return const SizedBox();
  if (value == 0) return const SizedBox();
  return SideTitleWidget(
    meta: meta,
    space: 6,
    child: Text(
      formatter(value),
      style: const TextStyle(
        color: Color(0xff67727d),
        fontWeight: FontWeight.bold,
        fontSize: 11,
      ),
      textAlign: TextAlign.right,
    ),
  );
}
