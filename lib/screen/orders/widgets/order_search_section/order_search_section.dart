import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/screen/orders/controller/controller.dart';
import 'package:flutter/material.dart';

Widget buildOrderSearchSection(
  BuildContext context,
  bool isMobile, {
  required TextEditingController searchController,
  required List<OrderModel> allOrders,
  required ValueNotifier<List<OrderModel>?> filteredOrders,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 20),
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: isMobile ? double.infinity : 900,
        maxHeight: isMobile ? 48 : 42,
      ),
      child: TextFormField(
        controller: searchController,
        onChanged: (query) =>OrderLogic. applyOrderSearch(
          query: query,
          allOrders: allOrders,
          filteredOrders: filteredOrders,
        ),
        style: TextStyle(
          color: AppColors.white,
          fontSize: isMobile ? 13 : 12,
        ),
        decoration: InputDecoration(
          fillColor:
              isMobile ? AppColors.sellerSurface : AppColors.black,
          filled: true,
          hintText: 'Search by Order ID or Customer...',
          hintStyle: const TextStyle(
              color: AppColors.sellerWhite54, fontSize: 12),
          prefixIcon: const Icon(Icons.search,
              color: AppColors.sellerWhite70, size: 20),
          suffixIcon: searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear,
                      color: AppColors.white38, size: 20),
                  onPressed: () {
                    searchController.clear();
                    filteredOrders.value = null;
                  },
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 16, vertical: isMobile ? 12 : 10),
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
            borderSide:
                const BorderSide(color: AppColors.white38, width: 1.5),
          ),
        ),
      ),
    ),
  );
}