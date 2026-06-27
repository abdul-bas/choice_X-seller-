
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/helpers/formate_number.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/revenue_overview_card/bottom_tittle_widget.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/revenue_overview_card/empty_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======


>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    super.key,
    required this.isDesk,
    required this.spots,
    required this.monthCount,
    this.useAspectRatio = true,
    this.mainLineColor,
    this.belowLineColor,
    this.aboveLineColor,
  });

  final bool isDesk;
  final List<FlSpot> spots;
  final int monthCount;
  final bool useAspectRatio;
  final Color? mainLineColor;
  final Color? belowLineColor;
  final Color? aboveLineColor;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final aboveColor =
        aboveLineColor ?? AppColors.danger.withValues(alpha: 0.2);

    
    final validSpots = spots.where((e) => e.y.isFinite).toList();

    if (validSpots.isEmpty) {
=======
  
    final aboveColor = aboveLineColor ?? AppColors.danger.withValues(alpha: 0.2);  

    if (spots.isEmpty) {
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
      return useAspectRatio
          ? AspectRatio(
              aspectRatio: isDesk ? 2 : 1.79,
              child: EmptyRevenueState(),
            )
          : EmptyRevenueState();
    }

<<<<<<< HEAD
    
    final maxY = validSpots
        .map((e) => e.y)
        .reduce((a, b) => a > b ? a : b);

    
    final interval = (maxY <= 0) ? 1.0 : (maxY / 5);

    final maxX = (monthCount <= 1) ? 1.0 : (monthCount - 1).toDouble();

    
    final cutOffY = maxY * 0.5;
=======
    final chartSpots  = spots.isEmpty ? [const FlSpot(0, 0)] : spots;
    final maxYValue   = chartSpots.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    final maxY        = maxYValue;
    final interval    = maxY / 5;
    final maxX        = (monthCount - 1).toDouble();
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7

    final chartContent = Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 20, 20),
      decoration: BoxDecoration(
<<<<<<< HEAD
        color: AppColors.sellerSurface,
=======
        color: AppColors.sellerSurface,                  
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.sellerBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
<<<<<<< HEAD
=======
         
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: maxX,
                minY: 0,
<<<<<<< HEAD
                maxY: maxY <= 0 ? 1 : maxY,

=======
                maxY: maxY,
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (spots) => spots
<<<<<<< HEAD
                        .where((s) => s.y.isFinite)
                        .map((s) => LineTooltipItem(
                              formatNumber(s.y),
                              const TextStyle(
                                color: AppColors.white,
=======
                        .map((s) => LineTooltipItem(
                              formatNumber(s.y),
                              const TextStyle(
                                color: AppColors.white, 
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ))
                        .toList(),
                  ),
                ),
<<<<<<< HEAD

                lineBarsData: [
                  LineChartBarData(
                    spots: validSpots,
                    isCurved: true,
                    barWidth: 1.5,
                    preventCurveOverShooting: true,
                    color: AppColors.white38,
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.brand.withValues(alpha: 0.2),
                      cutOffY: cutOffY,
=======
                lineBarsData: [
                  LineChartBarData(
                    spots: chartSpots,
                    isCurved: true,
                    barWidth: 1.5,
                    preventCurveOverShooting: true,
                    color: AppColors.white38,           
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.brand.withValues(alpha: 0.2),
                      cutOffY: 5.0,
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                      applyCutOffY: true,
                    ),
                    aboveBarData: BarAreaData(
                      show: true,
                      color: aboveColor,
<<<<<<< HEAD
                      cutOffY: cutOffY,
=======
                      cutOffY: 5.0,
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                      applyCutOffY: true,
                    ),
                    dotData: const FlDotData(show: false),
                  ),
                ],
<<<<<<< HEAD

=======
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 28,
<<<<<<< HEAD
                      getTitlesWidget: (v, m) =>
                          bottomTitleWidget(v, m, monthCount),
=======
                      getTitlesWidget: (v, m) => bottomTitleWidget(
                        v, m, monthCount,
                      ),
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
<<<<<<< HEAD
                      interval: interval <= 0 ? 1 : interval,
=======
                      interval: interval,
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                      reservedSize: 52,
                      getTitlesWidget: leftTitleWidget,
                    ),
                  ),
                ),
<<<<<<< HEAD

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: interval <= 0 ? 1 : interval,
                  getDrawingHorizontalLine: (_) => FlLine(
                    strokeWidth: 2,
                    gradient: LinearGradient(colors: [
                      AppColors.sellerSurface,
                      AppColors.sellerBorder,
=======
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: interval,
                  getDrawingHorizontalLine: (_) => FlLine(
                    strokeWidth: 2,
                    gradient: LinearGradient(colors: [
                      AppColors.sellerSurface,          
                      AppColors.sellerBorder,           
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                      AppColors.sellerBorder,
                      AppColors.sellerBorder,
                      AppColors.sellerSurface,
                    ]),
                  ),
                ),
<<<<<<< HEAD

=======
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ],
      ),
    );

    return useAspectRatio
        ? AspectRatio(aspectRatio: isDesk ? 2 : 1.79, child: chartContent)
        : chartContent;
  }
}