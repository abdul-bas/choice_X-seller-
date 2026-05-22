import 'dart:convert';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/helpers/get_formatted_id.dart';
import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:choice_x_seller/state/bloc/order/order_bloc.dart';
import 'package:choice_x_seller/state/bloc/order/order_state/order_state.dart';
import 'package:choice_x_seller/core/utils/firestore_helpers/stream.dart';
import 'package:choice_x_seller/core/utils/colors/order_status_colors.dart';
import 'package:choice_x_seller/core/utils/helpers/date_formatter.dart';
import 'package:choice_x_seller/screen/orders/widgets/mobile_view/order_mobile_row.dart';
import 'package:choice_x_seller/screen/orders/widgets/mobile_view/order_mobile_status_drop_down.dart';
import 'package:choice_x_seller/screen/orders/widgets/mobile_view/ordered_details_row.dart';
import 'package:choice_x_seller/screen/orders/widgets/mobile_view/ordered_item_row.dart';
import 'package:choice_x_seller/screen/orders/widgets/mobile_view/section_label.dart';
import 'package:choice_x_seller/screen/orders/widgets/mobile_view/status_badge.dart';
import 'package:choice_x_seller/screen/orders/widgets/mobile_view/tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileOrderItemWrapper extends StatelessWidget {
  final OrderModel order;
  final OrdersOprations getOrders;

  const MobileOrderItemWrapper({
    super.key,
    required this.order,
    required this.getOrders,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      buildWhen: (previous, current) {
        if (current is OrderUpdatedSuccessfully) {
          return current.order.orderId == order.orderId;
        }
        return false;
      },
      builder: (context, state) {
        final currentOrder = (state is OrderUpdatedSuccessfully &&
                state.order.orderId == order.orderId)
            ? state.order
            : order;
        final statusColor = getOrderStatusColor(currentOrder.itemStatus);

        return FutureBuilder(
          future: getOrders.getUserData(currentOrder.userId),
          builder: (context, asyncSnapshot) {
            final result = handleSnapshot(asyncSnapshot);
            if (result != null) return result;
            final user = asyncSnapshot.data!;

            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.sellerSurface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.sellerBorder),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.40),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                      BoxShadow(
                        // statusColor is runtime — withValues allowed
                        color: statusColor.withValues(alpha: 0.05),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'ORDER ID',
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.sellerStepInactive,
                                      letterSpacing: 1.3,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    groupedTxn(order.orderId),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.sellerHeading,
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            StatusBadge(
                                label: order.itemStatus, color: statusColor),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: mobileOrderRow(
                                'Customer',
                                user.name,
                                icon: Icons.person_outline_rounded,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: mobileOrderRow(
                                'Payment',
                                order.paymentStatus,
                                icon: Icons.wallet_outlined,
                                color:
                                    order.paymentStatus.toLowerCase() == 'paid'
                                        ? AppColors.sellerAccentGreen
                                        : AppColors.warningIcon,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: mobileOrderRow(
                                'Amount',
                                '${order.amount}',
                                icon: Icons.currency_rupee_rounded,
                                color: AppColors.sellerHeading,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                            height: 1, color: AppColors.sellerStepInactive),
                        const SizedBox(height: 16),
                        const SectionLabel(label: 'Ordered Item'),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 84,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: AppColors.sellerBorder),
                                image: DecorationImage(
                                  image:
                                      MemoryImage(base64Decode(order.images)),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.black.withValues(alpha: 0.40),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order.productName,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.sellerHeading,
                                      height: 1.3,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Row(
                                    children: [
                                      Tag(label: order.brand),
                                      const SizedBox(width: 5),
                                      Tag(label: order.model),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  buildOrderedItemRow(
                                      'Qty :', '${order.quantity} '),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                            height: 1, color: AppColors.sellerStepInactive),
                        const SizedBox(height: 16),
                        const SectionLabel(label: 'Order Details'),
                        const SizedBox(height: 12),
                        buildOrderedDetailsRow(
                          'Order Date',
                          formatDate(order.date),
                          icon: Icons.calendar_today_outlined,
                        ),
                        const SizedBox(height: 8),
                        buildOrderedDetailsRow(
                          'Payment Method',
                          order.paymentMethod,
                          icon: Icons.payment_outlined,
                        ),
                        const SizedBox(height: 8),
                        buildOrderedDetailsRow(
                          'Shipping Address',
                          order.paymentAddress,
                          icon: Icons.location_on_outlined,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                buildOrderMobileStatusDropdown(currentOrder, context, order),
              ],
            );
          },
        );
      },
    );
  }
}
