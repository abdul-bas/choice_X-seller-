
  import 'package:choice_x_seller/core/utils/helpers/get_formatted_id.dart';
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/models/user_model/user_model.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/desktop_view/build_info_row.dart';
import 'package:flutter/material.dart';


class ReturnUserInfo extends StatelessWidget {
  const ReturnUserInfo({
    super.key,
    required this.user,
    required this.request,
    required this.isTablet,
  });

  final UserModel user;
  final ReturnRequestModel request;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReturnInfoRow(label: 'Customer:',   value: user.name,                       isTablet: isTablet),
        SizedBox(height: isTablet ? 4 : 6),
        ReturnInfoRow(label: 'Order ID:',   value: request.orderId,                 isTablet: isTablet),
        SizedBox(height: isTablet ? 4 : 6),
        ReturnInfoRow(label: 'Payment ID:', value: groupedTxn(request.paymentId),   isTablet: isTablet),
        SizedBox(height: isTablet ? 4 : 6),
        ReturnInfoRow(label: 'Customer Id:', value: request.userId,                 isTablet: isTablet),
      ],
    );
  }
}