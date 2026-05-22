import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/seller_dashboard/controller/controller.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/order_stat_card/legend_item.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/order_stat_card/order_empty_stat.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/order_stat_card/order_stat_entry.dart';

import 'package:choice_x_seller/state/get_x/seller_order_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatusCardWidget extends StatelessWidget {
  const OrderStatusCardWidget({
    super.key,
    required this.isMobile,
    this.useAspectRatio = false,
  });

  final bool isMobile;
  final bool useAspectRatio;

  static final List<StatusEntry> _entries = [
    StatusEntry('Order Placed',     AppColors.orderStatusPlaced,     'placed'),
    StatusEntry('Confirmed',        AppColors.orderStatusConfirmed,  'confirmed'),
    StatusEntry('Processing',       AppColors.orderStatusProcessing, 'processing'),
    StatusEntry('Out for Delivery', AppColors.orderStatusDelivery,   'outForDelivery'),
    StatusEntry('Delivered',        AppColors.orderStatusDelivered,  'delivered'),
    StatusEntry('Cancelled',        AppColors.orderStatusCancelled,  'cancelled'),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellerOrderController>(
      builder: (controller) {
        if (controller.allTotalOrders == 0) {
          return const OrderStatusEmptyState();
        }

        final total = controller.allTotalOrders;

     
        final hasAnyPieData = _entries.any(
          (e) => DashboardLogic.getPieValue(e.key, controller) > 0,
        );

        final inner = Container(
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
                child: hasAnyPieData
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 250,
                            height: 250,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                PieChart(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeOutCubic,
                                  PieChartData(
                                    sectionsSpace: 2,
                                    centerSpaceRadius: isMobile ? 40 : 70,
                                    centerSpaceColor: AppColors.sellerSurface,
                                    sections: _entries.map((e) {
                                      return PieChartSectionData(
                                        color: e.color,
                                        value: DashboardLogic.getPieValue(
                                          e.key, controller,
                                        ),
                                        radius: 45,
                                        title: '',
                                        borderSide: BorderSide(
                                          color: e.color.withValues(alpha: 0.3),
                                          width: 1.5,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      total.toString(),
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        height: 1,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'orders',
                                      style: TextStyle(
                                        color: AppColors.white.withValues(alpha: 0.5),
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _entries
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: LegendItem(
                                          label: e.label,
                                          color: e.color,
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      )
                    : const OrderStatusEmptyState(),   
              ),
            ],
          ),
        );

        return useAspectRatio
            ? AspectRatio(
                aspectRatio: isMobile ? 0.5 : 1.15,
                child: inner,
              )
            : inner;
      },
    );
  }
}