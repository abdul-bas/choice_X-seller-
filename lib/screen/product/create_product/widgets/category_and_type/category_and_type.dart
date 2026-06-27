import 'package:choice_x_seller/screen/product/create_product/widgets/category_and_type/category_field.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/category_and_type/type_field.dart';
import 'package:choice_x_seller/services/db_service/database_service.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:flutter/material.dart';

class CategoryType extends StatelessWidget {
  CategoryType(this.c, {super.key, required this.isMobile});

  final AddProductController c;
  final bool isMobile;
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              categoryField(_databaseService),
              const SizedBox(height: 16),
              typeField(),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: categoryField(_databaseService)),
              const SizedBox(width: 12),
              Expanded(child: typeField()),
            ],
          );
  }

}