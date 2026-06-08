import 'package:choice_x_seller/config/app_bar_configs.dart';
import 'package:choice_x_seller/config/search_icon_btn.dart';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/firestore_helpers/set_orders.dart';
import 'package:choice_x_seller/core/widgets/app_bar/app_bar.dart';
import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:choice_x_seller/screen/orders/controller/controller.dart';
import 'package:choice_x_seller/state/get_x/toggle_menubar.dart';
import 'package:choice_x_seller/core/utils/firestore_helpers/stream.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_desk_top_view.dart';
import 'package:choice_x_seller/screen/orders/widgets/mobile_view/order_mobile_view.dart';
import 'package:choice_x_seller/screen/orders/widgets/order_empty_state/order_empty_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';


class OrderScreen extends StatelessWidget {
  OrderScreen({
    super.key,
    required this.isDesk,
    required this.isMobile,
    required this.isTab,
  });

  final bool isMobile;
  final bool isTab;
  final bool isDesk;

  final OrdersOprations _getOrders = OrdersOprations();
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<List<OrderModel>?> filteredOrders =
      ValueNotifier<List<OrderModel>?>(null);
  final DashbordSideview toggleMenubarController =
      Get.find<DashbordSideview>();
  final ValueNotifier<bool> isSearchOpen = ValueNotifier<bool>(false);
  final FocusNode searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: AppColors.transparent,
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: _getOrders.getOrder(),
          builder: (context, snapshot) {
            final state = handleSnapshot(snapshot);
            if (state != null) return state;

            final List<OrderModel> allOrders =
                setOrders(orders: snapshot.data!.docs);

            return ValueListenableBuilder<List<OrderModel>?>(
              valueListenable: filteredOrders,
              builder: (context, value, _) {
                final List<OrderModel> displayOrders = value ?? allOrders;

                return Column(
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: isSearchOpen,
                      builder: (context, open, _) {
                        return UniversalAppBar(
                          config: AppBarConfigs.orders,
                          isMobile: isMobile,
                          searchOpen: open,
                          searchCtrl: searchController,
                          searchFocus: searchFocus,
                          onSearchClose: () {
                            searchController.clear();
                            filteredOrders.value = null;
                            isSearchOpen.value = false;
                          },
                          onSearch: (query) =>OrderLogic. applyOrderSearch(
                            query: query,
                            allOrders: allOrders,
                            filteredOrders: filteredOrders,
                          ),
                          searchButton: AppBarSearchIconBtn(
                            isActive: !open,
                            onTap: () {
                              isSearchOpen.value = !open;
                              if (!open) {
                                Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () => searchFocus.requestFocus(),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: Container(
                        margin: isMobile
                            ? null
                            : const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        padding:
                            isMobile ? null : const EdgeInsets.all(15),
                        decoration: isMobile
                            ? null
                            : BoxDecoration(
                                color: AppColors.sellerSurface,
                                borderRadius: BorderRadius.circular(16),
                              ),
                        child: Container(
                          padding:isMobile?EdgeInsets.symmetric(vertical: 8): const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.sellerSurfaceDeep,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: isMobile
                                ? BorderRadius.zero
                                : BorderRadius.circular(16),
                            child: displayOrders.isEmpty
                                ? buildOrderEmptyState(isMobile)
                                : SingleChildScrollView(
                                    child: isMobile
                                        ? buildOrderMobileView(
                                            displayOrders,
                                            context,
                                            _getOrders,
                                          )
                                        : buildOrderDesktopView(
                                            displayOrders,
                                            isTab,
                                            context,
                                            _getOrders,
                                          ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
