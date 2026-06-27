<<<<<<< HEAD
import 'package:choice_x_seller/config/alert_config.dart';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/dialogs/alert_dialog.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_bloc.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_event.dart';
import 'package:choice_x_seller/screen/product/read_product/desktop_view/widgets/text_button.dart';
=======
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_bloc.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_event.dart';
import 'package:choice_x_seller/screen/product/read_product/desktop_view/widgets/text_button.dart';
import 'package:choice_x_seller/screen/product/edit_product/edit_product.dart';
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReadDesktopActionButtons extends StatelessWidget {
  const ProductReadDesktopActionButtons({
    super.key,
    required this.product,
    required this.onDelete,
  });
<<<<<<< HEAD
  
=======

>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
  final ProductModel product;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: TextButtonWidget(
<<<<<<< HEAD
                function: () => ProductLogic.navigateToEdit(context,product),
=======
                function: () => showDialog(
                  context: context,
                  builder: (_) => EditProductScreen(product: product),
                ),
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                fontSize: 7,
                buttonHight: 20,
                text: 'Edit',
                textcolor: AppColors.white,             
                buttonColor: AppColors.brand,         
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextButtonWidget(
<<<<<<< HEAD
                 function: () {
  final isLive = product.status == 'Live';
 final status=isLive ? 'In Active' : 'Live';
  showDialog(
    context: context,
    builder: (_) => CustomAlertDialog(
      config: AlertDialogConfig.warning(title: '${status .toUpperCase()} Product', content: 'Are you sure you want to ${status.toUpperCase()} this product? It will become ${isLive ?  'unavailable':'available'} to customers.', onConfirm: () {
        product.status =status ;

        context.read<ProductCrudBloc>().add(
          UpdateStatus(
            model: product,
          ),
        );
      },),
     
    ),
  );
},
=======
                function: () {
                  product.status =
                      product.status == 'Live' ? 'In Active' : 'Live';
                  context
                      .read<ProductCrudBloc>()
                      .add(UpdateStatus(model: product));
                },
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                text: product.status == 'Live' ? 'In Active' : 'Live',
                buttonHight: 20,
                fontSize: 7,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextButtonWidget(
                text: 'Delete',
                function: onDelete,
                buttonHight: 20,
                fontSize: 7,
                buttonColor: AppColors.danger,          
                textcolor: AppColors.white,           
              ),
            ),
          ],
        ),
      ),
    );
  }
}