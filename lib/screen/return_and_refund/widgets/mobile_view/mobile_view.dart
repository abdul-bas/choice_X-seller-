
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/mobile_view/mobile_item_wrapper.dart';
import 'package:flutter/material.dart';


class ReturnMobileView extends StatelessWidget {
  const ReturnMobileView({
    super.key,
    required this.requests,
    required this.getRequests,
  });

  final List<ReturnRequestModel> requests;
  final OrdersOprations getRequests;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: requests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) => MobileReturnItemWrapper(
        request: requests[i],
        getRequests: getRequests,
      ),
    );
  }
}