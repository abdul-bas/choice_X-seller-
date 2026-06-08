import 'package:choice_x_seller/core/utils/snackbar/status_snackbar.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_bloc.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget productListener({required Widget child}) {
  return BlocListener<ProductCrudBloc, ProductCrudState>(
    listener: (context, state) {
      if (!context.mounted) return;
      if (state is ProductLoaded) {
        showStatusSnackBar(context, state.message, state.color);
      } else if (state is ProductError) {
        showStatusSnackBar(context, state.message, state.color);
      }
    },
    child: BlocBuilder<ProductCrudBloc, ProductCrudState>(
      builder: (context, state) {
        return Stack(
          children: [
            child,
            if (state is ProductLoading)
              const Positioned.fill(
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    ),
  );
}
