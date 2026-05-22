
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/helpers/formate_number.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/revenue_overview_card/bottom_tittle_widget.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/revenue_overview_card/empty_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


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
  
    final aboveColor = aboveLineColor ?? AppColors.danger.withValues(alpha: 0.2);  

    if (spots.isEmpty) {
      return useAspectRatio
          ? AspectRatio(
              aspectRatio: isDesk ? 2 : 1.79,
              child: EmptyRevenueState(),
            )
          : EmptyRevenueState();
    }

    final chartSpots  = spots.isEmpty ? [const FlSpot(0, 0)] : spots;
    final maxYValue   = chartSpots.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    final maxY        = maxYValue;
    final interval    = maxY / 5;
    final maxX        = (monthCount - 1).toDouble();

    final chartContent = Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 20, 20),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,                  
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.sellerBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: maxX,
                minY: 0,
                maxY: maxY,
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (spots) => spots
                        .map((s) => LineTooltipItem(
                              formatNumber(s.y),
                              const TextStyle(
                                color: AppColors.white, 
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ))
                        .toList(),
                  ),
                ),
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
                      applyCutOffY: true,
                    ),
                    aboveBarData: BarAreaData(
                      show: true,
                      color: aboveColor,
                      cutOffY: 5.0,
                      applyCutOffY: true,
                    ),
                    dotData: const FlDotData(show: false),
                  ),
                ],
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
                      getTitlesWidget: (v, m) => bottomTitleWidget(
                        v, m, monthCount,
                      ),
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: interval,
                      reservedSize: 52,
                      getTitlesWidget: leftTitleWidget,
                    ),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: interval,
                  getDrawingHorizontalLine: (_) => FlLine(
                    strokeWidth: 2,
                    gradient: LinearGradient(colors: [
                      AppColors.sellerSurface,          
                      AppColors.sellerBorder,           
                      AppColors.sellerBorder,
                      AppColors.sellerBorder,
                      AppColors.sellerSurface,
                    ]),
                  ),
                ),
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