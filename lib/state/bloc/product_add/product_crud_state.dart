import 'package:flutter/material.dart';

abstract class ProductCrudState {}




class ProductLoading extends ProductCrudState {}

class ProductLoaded extends ProductCrudState {
 final String message;
  final String scaffoldHeadText;
  final String scaffoldSubText;
  final IconData icon;
  final Color color;

  ProductLoaded({
    required this.message,
    required this.scaffoldHeadText,
    required this.scaffoldSubText,
    required this.icon,
    required this.color,
  });
}

class ProductError extends ProductCrudState {
  final String message;
  final String scaffoldHeadText;
  final String scaffoldSubText;
  final IconData icon;
  final Color color;

  ProductError({
    required this.message,
    required this.scaffoldHeadText,
    required this.scaffoldSubText,
    required this.icon,
    required this.color,
  });
}