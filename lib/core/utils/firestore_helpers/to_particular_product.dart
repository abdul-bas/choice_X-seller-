import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

ProductModel? toParticularProduct(
  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot,
) {
  if (!snapshot.hasData) return null;

  final doc = snapshot.data!;
  final data = doc.data();

  if (!doc.exists || data == null) return null;

  return ProductModel.fromMap(data);
}
