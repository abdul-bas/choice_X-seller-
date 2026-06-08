import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/helpers/formate_number.dart';
import 'package:choice_x_seller/core/utils/helpers/get_color_percentage.dart';
import 'package:choice_x_seller/screen/seller_dashboard/controller/controller.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/dash_board_stat_card/stat.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/mobile_view/section_lable.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/order_stat_card/order_stat_card.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/order_status_filter_bar/order_status_filter_bar.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/revenue_filter/revenue_filter.dart';

import 'package:choice_x_seller/screen/seller_dashboard/widgets/revenue_overview_card/revenue_overview_card.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/stat_filter_bar/stat_filter_bar.dart';
import 'package:choice_x_seller/state/get_x/revenue_filter_controller.dart';
import 'package:choice_x_seller/state/get_x/seller_order_controller.dart';
import 'package:choice_x_seller/state/get_x/stat_filter_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DashboardDeskLayout extends StatelessWidget {
  const DashboardDeskLayout({
    super.key,
    required this.orderController,
    required this.isLoadingChart,
    required this.allSpots,
  });

  final SellerOrderController orderController;
  final bool isLoadingChart;
  final List<FlSpot> allSpots;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RevenueFilterController>(
      builder: (filterController) {
        final filteredSpots = DashboardLogic.filterSpots(
          allSpots,
          filterController.monthCount,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<StatFilterController>(
              builder: (statFilter) {
                return GetBuilder<SellerOrderController>(
                  builder: (controller) {
                    final revenue = controller.totalRevenue;
                    final total = controller.allTotalOrders;
                    final pending = controller.pendingOrders;
                    final completed = controller.completedOrders;
                    
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.sellerBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const DashboardSectionLabel('Overview'),
                              const Spacer(),
                              StatFilterBar(),
                            ],
                          ),
                          const SizedBox(height: 12),
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: DashBoardStatCard(
                                    title: 'Total Earnings',
                                    value: formatNumber(revenue),
                                    accentColor: getColorFromPercentage(85),
                                    progressKey: 'earnings',
                                    arcSubLabel: 'Monthly',
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: DashBoardStatCard(
                                    title: 'Total Orders',
                                    value: formatNumber(total),
                                    accentColor: getColorFromPercentage(70),
                                    progressKey: 'orders',
                                    arcSubLabel: 'Delivered',
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: DashBoardStatCard(
                                    title: 'Pending Orders',
                                    value: formatNumber(pending),
                                    accentColor: getColorFromPercentage(90),
                                    progressKey: 'listings',
                                    arcSubLabel: 'Products',
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: DashBoardStatCard(
                                    title: 'Completed Orders',
                                    value: formatNumber(completed),
                                    accentColor: getColorFromPercentage(60),
                                    progressKey: 'messages',
                                    arcSubLabel: 'Delivered',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.sellerBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const DashboardSectionLabel('Revenue'),
                              const Spacer(),
                              RevenueFilterBar(),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: isLoadingChart
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : LineChartWidget(
                                    isDesk: true,
                                    spots: filteredSpots,
                                    monthCount: filterController.monthCount,
                                    useAspectRatio: false,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.sellerBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const DashboardSectionLabel('Order Status'),
                              const Spacer(),
                              OrderStatusFilterBar(),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Expanded(
                            child: OrderStatusCardWidget(
                              isMobile: false,
                              useAspectRatio: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
