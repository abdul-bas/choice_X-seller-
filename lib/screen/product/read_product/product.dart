import 'package:choice_x_seller/config/app_bar_configs.dart';
import 'package:choice_x_seller/config/search_icon_btn.dart';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/firestore_helpers/get_seller_product.dart';
import 'package:choice_x_seller/core/widgets/app_bar/add_button.dart';
import 'package:choice_x_seller/core/widgets/app_bar/app_bar.dart';
import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/create_product/create_product.dart';
import 'package:choice_x_seller/screen/product/listener/product_listener.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_bloc.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_event.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/read_product/dialogs/delete_confirmation_dialog.dart';
import 'package:choice_x_seller/screen/product/read_product/empty_product_state/empty_product_state.dart';
import 'package:choice_x_seller/screen/product/read_product/desktop_view/desk_top_view.dart';
import 'package:choice_x_seller/screen/product/read_product/mobile_view/mobile_product_view.dart';
import 'package:choice_x_seller/screen/product/read_product/product_search_empty_state/product_search_empty_state.dart';
import 'package:choice_x_seller/core/utils/firestore_helpers/stream.dart';
import 'package:choice_x_seller/repository/auth_repository/repository.dart';
import 'package:choice_x_seller/repository/product_crud_repository/product_crud_repository.dart';
import 'package:choice_x_seller/state/get_x/filterProducts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({
    super.key,
    required this.isDesk,
    required this.isMobile,
    required this.isTab,
  });

  final bool isMobile;
  final bool isTab;
  final bool isDesk;

  final filterController = Get.put(FilterProducts());
  final productController = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    final searchFocus = FocusNode();

    return Column(
      children: [
        GetBuilder<AddProductController>(
            id: 'search',
            builder: (controller) {
              return UniversalAppBar(
                onSearchClose: () {
                  controller.closeSearch(
                    filterController,
                  );
                },
                isMobile: isMobile,
                searchOpen: controller.isSearchOpen,
                searchFocus: searchFocus,
                searchCtrl: filterController.searchEditingController,
                onSearch: filterController.filterProducts,
                config: AppBarConfigs.products,
                addButton: AppBarAddBtn(
                  label: '+ Add Product',
                  accent: AppColors.white,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => CreateProduct(),
                    );
                  },
                ),
                searchButton: AppBarSearchIconBtn(
                  isActive: !controller.isSearchOpen,
                  onTap: controller.toggleSearch,
                ),
              );
            }),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: ProductCrudRepository().getProduct(),
            builder: (context, snapshot) {
              final result = handleSnapshot(snapshot);

              if (result != null) {
                return result;
              }

              final sellerId = AuthRepository().sellerId();

              final products = getSellerProducts(
                snapshot.data!.docs,
                sellerId,
              );

              if (products.isEmpty) {
                return EmptyProductsState(
                  isMobile: isMobile,
                );
              }

              filterController.setProducts(products);

              return LayoutBuilder(
                builder: (context, constraints) {
                  return productListener(
                    child: GetBuilder<AddProductController>(
                      id: 'search',
                      builder: (controller) {
                        return SizedBox.expand(
                          child: Container(
                            margin: isMobile
                                ? null
                                : const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            padding: isMobile ? null : const EdgeInsets.all(15),
                            decoration: isMobile
                                ? null
                                : BoxDecoration(
                                    color: AppColors.sellerSurface,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                            child: Container(
                              padding:
                                  isMobile ? null : const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.sellerSurfaceDeep,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Obx(() {
                                if (filterController.filteredProducts.isEmpty) {
                                  return EmptySearchState(
                                    constraints: constraints,
                                    isMobile: isMobile,
                                  );
                                }

                                return isMobile
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: products.length,
                                        itemBuilder: (
                                          context,
                                          index,
                                        ) {
                                          final product = products[index];

                                          return MobileProductView(
                                            product: product,
                                            onEdit: () {
                                              ProductLogic.navigateToEdit(
                                                context,
                                                product,
                                              );
                                            },
                                            onToggleStatus: () {
                                              product.status =
                                                  product.status == 'Live'
                                                      ? 'In Active'
                                                      : 'Live';

                                              context
                                                  .read<ProductCrudBloc>()
                                                  .add(
                                                    UpdateStatus(
                                                      model: product,
                                                    ),
                                                  );
                                            },
                                            onDelete: () {
                                              showProductDeleteConfirmation(
                                                context,
                                                product,
                                                () {
                                                  Navigator.of(context).pop();

                                                  context
                                                      .read<ProductCrudBloc>()
                                                      .add(
                                                        DeleteProduct(
                                                          model: product,
                                                        ),
                                                      );
                                                },
                                              );
                                            },
                                            onViewDetails: () {
                                              ProductLogic.navigateToDetail(
                                                context,
                                                product,
                                              );
                                            },
                                          );
                                        },
                                      )
                                    : DesktopProductTable(
                                        filterController: filterController,
                                      );
                              }),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
