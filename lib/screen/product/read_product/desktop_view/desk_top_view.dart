import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_bloc.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_event.dart';
import 'package:choice_x_seller/screen/product/product_detail_page/product_detail_page.dart';
import 'package:choice_x_seller/screen/product/read_product/desktop_view/widgets/action_buttons.dart';
import 'package:choice_x_seller/screen/product/read_product/desktop_view/widgets/header.dart';
import 'package:choice_x_seller/screen/product/read_product/desktop_view/widgets/status_cell.dart';
import 'package:choice_x_seller/screen/product/read_product/desktop_view/widgets/table_cell.dart';
import 'package:choice_x_seller/screen/product/read_product/dialogs/delete_confirmation_dialog.dart';
import 'package:choice_x_seller/state/get_x/filterProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DesktopProductTable extends StatelessWidget {
  const DesktopProductTable({super.key, required this.filterController});

  final FilterProducts filterController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        
        const ProductReadTableHeader(),
        ...filterController.filteredProducts.map((product) {
          return Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        SellerProductDetailPage(product: product),
                  ),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color:  AppColors.sellerSurface,          
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProductReadTableCell(text: product.model,       flex: 2),
                        ProductReadTableCell(text: product.productType, flex: 2),
                        ProductReadTableCell(text: product.warranty,    flex: 2),
                        ProductReadTableCell(text: product.weight ?? '', flex: 1),
                        ProductReadTableCell(text: product.size,        flex: 1),
                        ProductReadTableCell(text: product.productName, flex: 2),
                        ProductReadTableCell(text: product.category,    flex: 2),
                        ProductReadTableCell(text: product.brand,       flex: 2),
                        ProductReadStatusCell(status: product.status),
                        ProductReadDesktopActionButtons(
                          product: product,
                          onDelete: () => showProductDeleteConfirmation(
                            context,
                            product,
                            () => context.read<ProductCrudBloc>().add(
                                  DeleteProduct(model: product),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}