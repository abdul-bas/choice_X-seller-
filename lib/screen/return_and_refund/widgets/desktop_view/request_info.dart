
  import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/core/utils/helpers/date_formatter.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/desktop_view/build_info_row.dart';
import 'package:flutter/material.dart';


class ReturnRequestInfo extends StatelessWidget {
  const ReturnRequestInfo({
    super.key,
    required this.request,
    required this.isTablet,
  });

  final ReturnRequestModel request;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final parts      = request.reason.split('_');
    final mainReason = parts.isNotEmpty ? parts[0] : request.reason;
    final moreInfo   = parts.length > 1 ? parts[1] : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: isTablet ? 4 : 6),
        ReturnInfoRow(
          label: 'Reason:',
          value: mainReason,
          isTablet: isTablet,
          maxLines: 1,
        ),
        if (moreInfo.isNotEmpty) ...[
          SizedBox(height: isTablet ? 4 : 6),
          ReturnInfoRow(
            label: 'More Information:',
            value: moreInfo,
            isTablet: isTablet,
            maxLines: 5,
          ),
        ],
        SizedBox(height: isTablet ? 4 : 6),
        ReturnInfoRow(
          label: 'Requested:',
          value: formatDate(request.createdAt),
          isTablet: isTablet,
        ),
      ],
    );
  }
}
