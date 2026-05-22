import 'package:choice_x_seller/config/app_bar_configs.dart';
import 'package:choice_x_seller/config/search_icon_btn.dart';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/widgets/app_bar/app_bar.dart';
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:choice_x_seller/state/bloc/order/order_bloc.dart';
import 'package:choice_x_seller/state/bloc/order/order_state/order_state.dart';
import 'package:choice_x_seller/state/bloc/order/return_and_refund_state/return_and_refund_state.dart';
import 'package:choice_x_seller/core/utils/firestore_helpers/stream.dart';
import 'package:choice_x_seller/core/utils/colors/return_status_color.dart';
import 'package:choice_x_seller/core/utils/snackbar/status_snackbar.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/desktop_view/desktop_view.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/empty_state/empty_state.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/mobile_view/mobile_view.dart';
import 'package:choice_x_seller/state/get_x/return_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
class ReturnRequestScreen extends StatelessWidget {
  ReturnRequestScreen({
    super.key,
    required this.isDesk,
    required this.isMobile,
    required this.isTab,
  });

  final bool isMobile;
  final bool isTab;
  final bool isDesk;

  final OrdersOprations _getRequests =
      OrdersOprations();

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(ReturnRequestController());

    return SafeArea(
      child: Material(
        color: AppColors.transparent,
        child: BlocListener<OrderBloc, OrderState>(
          listener: (context, state) {
            if (state
                is ReturnAndRefundStateUpdatedSuccessfully) {
              showStatusSnackBar(
                context,
                'Return request status updated successfully',
                returnStatusColor(
                  state.requestModel.status,
                ),
              );
            }
          },
          child: FutureBuilder<OrderState>(
            future: _getRequests.getReturnRequests(),
            builder: (context, snapshot) {
              final stateWidget =
                  handleSnapshot(snapshot);

              if (stateWidget != null) {
                return stateWidget;
              }

              final state = snapshot.data;

              if (state
                  is! ReturnAndRefundStateGetSuccessfully) {
                return const Center(
                  child: Text(
                    'Something went wrong',
                  ),
                );
              }

              final allRequests = state.snapshot.docs
                  .map(
                    (doc) =>
                        ReturnRequestModel.fromJson(
                      doc.data(),
                    ),
                  )
                  .toList();

              return Obx(() {
                final displayRequests =
                    controller.filteredRequests.value ??
                        allRequests;

                return Column(
                  children: [
                    UniversalAppBar(
                      config: AppBarConfigs.returns,
                      isMobile: isMobile,
                      searchOpen:
                          controller.isSearchOpen.value,
                      searchCtrl:
                          controller.searchController,
                      searchFocus:
                          controller.searchFocus,
                      onSearchClose:
                          controller.closeSearch,
                      onSearch: (q) {
                        controller.onSearch(
                          q,
                          allRequests,
                        );
                      },
                      searchButton:
                          AppBarSearchIconBtn(
                        isActive: !controller
                            .isSearchOpen.value,
                        onTap:
                            controller.toggleSearch,
                      ),
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
                           padding:isMobile?null: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.sellerSurfaceDeep,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: !isMobile
                                ? BorderRadius.circular(
                                    16,
                                  )
                                : BorderRadius.zero,
                            child:
                                displayRequests.isEmpty
                                    ? ReturnEmptyState(
                                        isMobile:
                                            isMobile,
                                      )
                                    : SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height:
                                                  isMobile
                                                      ? 16
                                                      : 0,
                                            ),
                                            isMobile
                                                ? ReturnMobileView(
                                                    requests:
                                                        displayRequests,
                                                    getRequests:
                                                        _getRequests,
                                                  )
                                                : ReturnDesktopView(
                                                    requests:
                                                        displayRequests,
                                                    isTab:
                                                        isTab,
                                                    getRequests:
                                                        _getRequests,
                                                  ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              });
            },
          ),
        ),
      ),
    );  }
}