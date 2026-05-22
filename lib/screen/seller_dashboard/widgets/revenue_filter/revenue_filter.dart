
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/seller_dashboard/controller/controller.dart';
import 'package:choice_x_seller/state/get_x/revenue_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RevenueFilterBar extends StatelessWidget {
  RevenueFilterBar({super.key});

  final controller =
      Get.find<RevenueFilterController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RevenueFilterController>(
      builder: (controller) {
        return Row(
          children: DashboardLogic.revenueFilters.map(
            (filter) {
              final isSelected =
                  controller.selected == filter;

              return InkWell(
                borderRadius:
                    BorderRadius.circular(20),
                onTap: () {
                  controller.select(filter);
                },
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  margin: const EdgeInsets.only(
                    right: 8,
                  ),
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.brand
                        : AppColors.sellerSurface,
                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.brand
                          : AppColors.sellerBorder,
                    ),
                  ),
                  child: Text(
                    filter,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight:
                          FontWeight.w600,
                      color: isSelected
                          ? AppColors.white
                          : AppColors
                              .sellerWhite54,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}