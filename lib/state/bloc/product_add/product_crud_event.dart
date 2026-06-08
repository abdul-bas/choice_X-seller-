import 'package:choice_x_seller/models/product_model/product_model.dart';

abstract class ProductCrudEvent {}

class AddProduct extends ProductCrudEvent {
  ProductModel model;
  AddProduct({required this.model});
}
class EditProduct extends ProductCrudEvent {
  final ProductModel product;

  EditProduct({required this.product});
}
class DeleteProduct extends ProductCrudEvent {
  ProductModel model;
  DeleteProduct({required this.model});
}
class UpdateStatus extends ProductCrudEvent {
  ProductModel model;
  
  UpdateStatus({required this.model});
}

