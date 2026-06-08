import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:flutter/material.dart';


class ReturnSearchSection extends StatefulWidget {
  const ReturnSearchSection({
    super.key,
    required this.searchController,
    required this.isMobile,
    required this.allRequests,
    required this.filteredRequests,
  });

  final TextEditingController searchController;
  final bool isMobile;
  final List<ReturnRequestModel> allRequests;
  final ValueNotifier<List<ReturnRequestModel>?> filteredRequests;

  @override
  State<ReturnSearchSection> createState() => _ReturnSearchSectionState();
}

class _ReturnSearchSectionState extends State<ReturnSearchSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.isMobile ? 16 : 20,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: widget.isMobile ? double.infinity : 900,
          maxHeight: widget.isMobile ? 48 : 42,
        ),
        child: TextFormField(
          controller: widget.searchController,
          onChanged: (query) {
            setState(() {});
            if (query.trim().isEmpty) {
              widget.filteredRequests.value = null;
            } else {
              final q = query.toLowerCase();
              widget.filteredRequests.value = widget.allRequests.where((r) =>
                r.requestId.toLowerCase().contains(q) ||
                r.orderId.toLowerCase().contains(q) ||
                r.userId.toLowerCase().contains(q) ||
                r.reason.toLowerCase().contains(q),
              ).toList();
            }
          },
          style: TextStyle(
            color: AppColors.white,                  
            fontSize: widget.isMobile ? 13 : 12,
          ),
          decoration: InputDecoration(
            fillColor: widget.isMobile
                ? AppColors.sellerSurface             
                : AppColors.sellerBg,               
            filled: true,
            hintText: 'Search by Request ID, Order ID or Reason...',
            hintStyle: const TextStyle(
              color: AppColors.sellerWhite54,         
              fontSize: 12,
            ),
            prefixIcon: const Icon(
              Icons.search,  
              size: 20,
            ),
            suffixIcon: widget.searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: AppColors.white38,       
                      size: 20,
                    ),
                    onPressed: () {
                      widget.searchController.clear();
                      widget.filteredRequests.value = null;
                      setState(() {});
                    },
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: widget.isMobile ? 12 : 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.white38,             
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}