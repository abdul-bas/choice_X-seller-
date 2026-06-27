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

class DashboardScrollLayout extends StatelessWidget {
  const DashboardScrollLayout({
    super.key,
    required this.orderController,
    required this.isLoadingChart,
    required this.isMobile,
    required this.isDesk,
    required this.allSpots,
  });

  final SellerOrderController orderController;
  final bool isLoadingChart;
  final bool isMobile;
  final bool isDesk;
  final List<FlSpot> allSpots;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RevenueFilterController>(
      builder: (filterController) {
        final filteredSpots = DashboardLogic.filterSpots(
          allSpots,
          filterController.monthCount,
        );

        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const DashboardSectionLabel('Overview'),
                  const Spacer(),
                  StatFilterBar(),
                ],
              ),
              const SizedBox(height: 10),
              GetBuilder<StatFilterController>(
                builder: (statFilter) {
                  return GetBuilder<SellerOrderController>(
                    builder: (controller) {
                     final revenue = controller.totalRevenue;
                    final total = controller.totalOrder;
                    final pending = controller.pendingOrders;
                    final completed = controller.completedOrders;
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: DashBoardStatCard(
                                  title: 'Total Earnings',
                                  value: revenue,
                                  accentColor: getColorFromPercentage(85),
                                  progressKey: 'earnings',
                                  arcSubLabel: 'Monthly',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: DashBoardStatCard(
                                  title:'Total Orders',
                                  value:total,
                                  accentColor: getColorFromPercentage(70),
                                  progressKey: 'orders',
                                  arcSubLabel: 'Delivered',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: DashBoardStatCard(
                                  title: 'Pending Orders',
                                  value: pending,
                                  accentColor: getColorFromPercentage(90),
                                  progressKey: 'listings',
                                  arcSubLabel: 'Products',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: DashBoardStatCard(
                                  title:'Completed Orders',
                                  value:completed,
                                  accentColor: getColorFromPercentage(60),
                                  progressKey: 'messages',
                                  arcSubLabel:'Delivered',
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const DashboardSectionLabel('Revenue Report'),
                  const Spacer(),
                  RevenueFilterBar(),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 300,
                child: isLoadingChart
                    ? const Center(child: CircularProgressIndicator())
                    : LineChartWidget(
                        isDesk: isDesk,
                        spots: filteredSpots,
                        monthCount: filterController.monthCount,
                        useAspectRatio: false,
                      ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const DashboardSectionLabel('Order Status'),
                   const Spacer(),
                              OrderStatusFilterBar(),
                ],
              ),
              const SizedBox(height: 12),
              GetBuilder<SellerOrderController>(
                builder: (_) {
                  return SizedBox(
                    height: 300,
                    child: OrderStatusCardWidget(
                      isMobile: isMobile,
                      useAspectRatio: false,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
