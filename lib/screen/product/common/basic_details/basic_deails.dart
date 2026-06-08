
import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/common/basic_details/brand_field.dart';
import 'package:choice_x_seller/screen/product/common/basic_details/model_field.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:choice_x_seller/services/db_service/database_service.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/common/input_fields/seller_input_field.dart';
import 'package:flutter/material.dart';
class BasicDetails extends StatelessWidget {
  BasicDetails(this.c, {super.key, required this.isMobile});

  final AddProductController c;
  final bool isMobile;
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Product Name'),
        SellerInputField(
          validator: ProductLogic.validateProductName,
          controller: c.cName,
          hint: 'e.g. Sony Bravia 55" 4K Smart TV',
          prefixIcon: Icons.devices_other_outlined,
        ),
        const SizedBox(height: 16),
        isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  brandField(_databaseService),
                  const SizedBox(height: 16),
                  modelField(c),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: brandField(_databaseService)),
                  const SizedBox(width: 12),
                  Expanded(child: modelField(c)),
                ],
              ),
      ],
    );
  }
}
