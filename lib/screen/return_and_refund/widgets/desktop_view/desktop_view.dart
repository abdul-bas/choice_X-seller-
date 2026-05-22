


  import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/desktop_view/header.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/desktop_view/return_item_wrapper.dart';
import 'package:flutter/material.dart';


class ReturnDesktopView extends StatelessWidget {
  const ReturnDesktopView({
    super.key,
    required this.requests,
    required this.isTab,
    required this.getRequests,
  });

  final List<ReturnRequestModel> requests;
  final bool isTab;
  final OrdersOprations getRequests;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReturnHeaderRow(isTablet: isTab),
        const Divider(
          color: AppColors.sellerWhite30,            
          height: 1,
          thickness: 1,
        ),
        ListView.builder(
          itemCount: requests.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ReturnItemWrapper(
            request: requests[index],
            isTablet: isTab,
            getRequests: getRequests,
          ),
        ),
      ],
    );
  }
}