
  import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/screen/product/read_product/mobile_view/widgets/header/status_toggle.dart';
import 'package:choice_x_seller/state/bloc/product_add/order_status.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_bloc.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductReadHeader extends StatelessWidget {
  const ProductReadHeader({
    super.key,
    required this.isLive,
    required this.product,
    required this.onToggleStatus,
  });

  final bool isLive;
  final ProductModel product;
  final VoidCallback? onToggleStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.sellerSurface,                 
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: BlocBuilder<ProductCrudBloc, ProductCrudState>(
        builder: (context, state) {
          bool currentIsLive = isLive;
          if (state is OrderStatusUpdated) {
            currentIsLive = state.newStatus == 'Live';
          }

          return Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.productName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,      
                          letterSpacing: 0.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 16),
                    ProductReadStatusToggle(
                      isLive: currentIsLive,
                      onToggleStatus: onToggleStatus,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}