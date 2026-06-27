
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/constants/connectivity_option.dart';
import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/seller_input_dd.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Connectivity extends StatelessWidget {
  const Connectivity(this.c, {super.key});
  final AddProductController c;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Label('Connectivity Options'),
          const SizedBox(height: 8),
          GetBuilder<AddProductController>(
            id: 'conn',
            builder: (c) => Wrap(
              spacing: 8,
              runSpacing: 8,
              children: connectivityOptions.map((opt) {
                final on = c.selectedConn.contains(opt);
                return GestureDetector(
                  onTap: () => c.toggleConn(opt),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 140),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 9),
                    decoration: BoxDecoration(
                      color: on
                          ? AppColors.brand
                          : AppColors.sellerSurface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: on
                            ? AppColors.brand
                            : AppColors.sellerBorder,
                        width: on ? 1.4 : 1,
                      ),
                    ),
                    child: Text(
                      opt,
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: on
                            ? AppColors.white
                            : AppColors.sellerWhite54,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          const Label('Warranty Period'),
          GetBuilder<AddProductController>(
            id: 'warranty',
            builder: (c) => SellerInputDD(
              validator:ProductLogic. validateWarranty,
              hint: 'Select warranty',
              icon: Icons.verified_outlined,
              value: c.warranty,
              items:ProductLogic. warrantyOptions,
              onChanged: c.setWarranty,
            ),
          ),
        ],
      );
}