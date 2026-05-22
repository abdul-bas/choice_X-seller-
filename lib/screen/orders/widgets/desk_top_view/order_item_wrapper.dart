import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:choice_x_seller/state/bloc/order/order_bloc.dart';
import 'package:choice_x_seller/state/bloc/order/order_state/order_state.dart';
import 'package:choice_x_seller/core/utils/firestore_helpers/stream.dart';
import 'package:choice_x_seller/screen/orders/widgets/cancelled_order_card/cancelled_order_card.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_details_content.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_details_header.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_summary_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItemWrapper extends StatelessWidget {
  final OrderModel order;
  final bool isTablet;
  final OrdersOprations getOrders;

  const OrderItemWrapper({
    super.key,
    required this.order,
    required this.isTablet,
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

        return FutureBuilder(
          future: getOrders.getUserData(currentOrder.userId),
          builder: (context, asyncSnapshot) {
            final result = handleSnapshot(asyncSnapshot);
            if (result != null) return result;

            final user = asyncSnapshot.data!;
            if (order.cancellationReason != null) {
              return buildCancelledOrderCard(
                  currentOrder, user, isTablet, context);
            }
            return Column(
              children: [
                buildOrderSummaryRow(currentOrder, user, isTablet, context),
                buildOrderDetailsHeader(isTablet),
                buildOrderDetailsContent(currentOrder, isTablet),
                const Divider(
                    color: AppColors.sellerBorder, height: 1, thickness: 1),
              ],
            );
          },
        );
      },
    );
  }
}
