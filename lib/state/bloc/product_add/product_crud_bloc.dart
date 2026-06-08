import 'package:choice_x_seller/repository/product_crud_repository/product_crud_repository.dart';
import 'package:choice_x_seller/state/bloc/product_add/order_status.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_init.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_event.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCrudBloc extends Bloc<ProductCrudEvent, ProductCrudState> {
  final ProductCrudRepository _crudRepository = ProductCrudRepository();
  ProductCrudBloc() : super(ProductAddInit()) {
    on<AddProduct>((event, emit) async {
      emit(ProductLoading());
      final resulte = await _crudRepository.addProduct(model: event.model);
      emit(resulte);
    });
     on<EditProduct>((event, emit) async {
  emit(ProductLoading());

  final resulte = await _crudRepository.updateProduct(event.product);
  emit(resulte);
});
    on<DeleteProduct>((event, emit) async {
      emit(ProductLoading());
      final resulte = await _crudRepository.productDelete(event.model);
      emit(resulte);
    });
    on<UpdateStatus>((event, emit) async {
      emit(ProductLoading());
      final resulte = await _crudRepository.statusUpdate(event.model);
      emit(resulte);
    });
    on<ChangeOrderStatus>((event, emit) async {
      emit(OrderStatusUpdating());
      final resulte = await _crudRepository.updateOrderStatus(itemId: event.itemId,newStatus: event.newStatus,orderId: event.orderId);
      emit(resulte);
    });
  }
}
