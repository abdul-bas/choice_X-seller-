import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/models/user_model/user_model.dart';
import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:choice_x_seller/state/bloc/order/order_bloc.dart';
import 'package:choice_x_seller/state/bloc/order/order_state/order_state.dart';
import 'package:choice_x_seller/state/bloc/order/return_and_refund_state/return_and_refund_state.dart';
import 'package:choice_x_seller/core/utils/firestore_helpers/stream.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/desktop_view/details_header.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/desktop_view/dtails_content.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/desktop_view/summery_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ReturnItemWrapper extends StatelessWidget {
  const ReturnItemWrapper({
    super.key,
    required this.request,
    required this.isTablet,
    required this.getRequests,
  });

  final ReturnRequestModel request;
  final bool isTablet;
  final OrdersOprations getRequests;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      buildWhen: (_, current) =>
          current is ReturnAndRefundStateUpdatedSuccessfully &&
          current.requestModel.requestId == request.requestId,
      builder: (context, state) {
        final displayRequest =
            state is ReturnAndRefundStateUpdatedSuccessfully &&
                    state.requestModel.requestId == request.requestId
                ? state.requestModel
                : request;

        return FutureBuilder(
          future: getRequests.getUserData(request.userId),
          builder: (context, asyncSnapshot) {
            final result = handleSnapshot(asyncSnapshot);
            if (result != null) return result;

            final user = asyncSnapshot.data as UserModel;

            return Column(
              children: [
                ReturnSummaryRow(
                  request: displayRequest,
                  user: user,
                  isTablet: isTablet,
                ),
                ReturnDetailsHeader(isTablet: isTablet),
                ReturnDetailsContent(
                  request: displayRequest,
                  user: user,
                  isTablet: isTablet,
                ),
                const Divider(
                  color: AppColors.sellerWhite24,     
                  height: 1,
                  thickness: 1,
                ),
              ],
            );
          },
        );
      },
    );
  }
}