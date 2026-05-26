import 'package:choice_x_seller/config/app_bar_configs.dart';

import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/helpers/get_spots.dart';
import 'package:choice_x_seller/core/widgets/animation/fad_slide_animation.dart';
import 'package:choice_x_seller/core/widgets/app_bar/app_bar.dart';
import 'package:choice_x_seller/screen/seller_dashboard/controller/trigger_animation.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/desk_top_view/desk_top_view.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/mobile_view/mobile_view.dart';
import 'package:choice_x_seller/screen/seller_dashboard/widgets/revenue_overview_card/empty_state.dart';
import 'package:choice_x_seller/state/get_x/arc_progress_controller.dart';
import 'package:choice_x_seller/state/get_x/order_stat_controller.dart';
import 'package:choice_x_seller/state/get_x/order_status_filter_controller.dart';
import 'package:choice_x_seller/state/get_x/revenue_filter_controller.dart';
import 'package:choice_x_seller/state/get_x/seller_order_controller.dart';
import 'package:choice_x_seller/state/get_x/stat_filter_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    required this.isDesk,
    required this.isMobile,
    required this.isTab,
  });

  final bool isMobile;
  final bool isTab;
  final bool isDesk;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final ArcProgressController arcController;
  late final OrderStatusController statusController;
  late final SellerOrderController orderController;
  late final RevenueFilterController revenueController;
  late final StatFilterController statFilterController;

  List<FlSpot> _allSpots = [];
  bool _isLoadingChart = true;

  @override
  void initState() {
    super.initState();

    arcController = Get.put(
      ArcProgressController(),
      permanent: true,
    );

    statusController = Get.put(
      OrderStatusController(),
      permanent: true,
    );

    revenueController = Get.put(
      RevenueFilterController(),
      permanent: true,
    );

    statFilterController = Get.put(
      StatFilterController(),
      permanent: true,
    );

    Get.put(
      OrderStatusFilterController(),
      permanent: true,
    );

    orderController = Get.find<SellerOrderController>();

    statFilterController.addOnFetchCompleteListener(() {
      if (mounted) {
        triggerAnimations(arcController, statusController);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await orderController.fetchTotalOrder();

      if (!mounted) return;

      triggerAnimations(arcController, statusController);

      final data = await getChartSpots();

      if (!mounted) return;

      setState(() {
        _allSpots = data;
        _isLoadingChart = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
   
  
    return SafeArea(
      child: FadeSlideAnimation(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UniversalAppBar(
              config: AppBarConfigs.dashboard,
              searchOpen: false,
              isMobile: widget.isMobile,
            ),
            SizedBox(height: widget.isMobile ? 5 : 0),
            Expanded(
              child: Container(
                margin: widget.isMobile
                    ? null
                    : const EdgeInsets.fromLTRB(10, 0, 10, 10),
                padding: widget.isMobile ? null : const EdgeInsets.all(15),
                decoration: widget.isMobile
                    ? null
                    : BoxDecoration(
                        color: AppColors.sellerSurface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.sellerSurfaceDeep,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: GetBuilder<SellerOrderController>(
                      builder: (controller) {
                          if (controller.totalRevenue == 0) {
              return EmptyRevenueState();
            }
                        return GetBuilder<ArcProgressController>(
                          builder: (_) {
                            return widget.isDesk
                                ? DashboardDeskLayout(
                                    orderController: controller,
                                    isLoadingChart: _isLoadingChart,
                                    allSpots: _allSpots,
                                  )
                                : DashboardScrollLayout(
                                    orderController: controller,
                                    isLoadingChart: _isLoadingChart,
                                    isMobile: widget.isMobile,
                                    isDesk: widget.isDesk,
                                    allSpots: _allSpots,
                                  );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
