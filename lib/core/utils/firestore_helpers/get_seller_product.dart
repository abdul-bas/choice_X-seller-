import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<ProductModel> getSellerProducts(
    List<QueryDocumentSnapshot> docs,
    String sellerId,
  ) {
    return docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .where((data) => data['sellerId'] == sellerId)
        .map((data) => ProductModel.fromMap(data))
        .toList();
  }
