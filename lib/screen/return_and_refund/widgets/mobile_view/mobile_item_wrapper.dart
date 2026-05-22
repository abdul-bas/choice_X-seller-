
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/models/user_model/user_model.dart';
import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/common/drop_down_status.dart';
import 'package:choice_x_seller/state/bloc/order/order_bloc.dart';
import 'package:choice_x_seller/state/bloc/order/order_state/order_state.dart';
import 'package:choice_x_seller/state/bloc/order/return_and_refund_state/return_and_refund_state.dart';
import 'package:choice_x_seller/core/utils/firestore_helpers/stream.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/mobile_view/return_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileReturnItemWrapper extends StatelessWidget {
  final ReturnRequestModel request;
  final OrdersOprations getRequests;

  const MobileReturnItemWrapper({super.key, 
    required this.request,
    required this.getRequests,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      buildWhen: (previous, current) {
        if (current is ReturnAndRefundStateUpdatedSuccessfully) {
          return current.requestModel.requestId == request.requestId;
        }
        return false;
      },
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
                ReturnCard(request: displayRequest, userName: user.name),
                const SizedBox(height: 8),
                ReturnStatusDropdown(request: displayRequest),
              ],
            );
          },
        );
      },
    );
  }
}
