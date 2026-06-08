 import 'package:choice_x_seller/core/utils/firestore_helpers/stream.dart';
import 'package:choice_x_seller/core/utils/firestore_helpers/extract_category_names.dart';
import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:choice_x_seller/services/db_service/database_service.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/common/input_fields/seller_input_dd.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
Widget brandField(DatabaseService databaseService) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Brand'),
        GetBuilder<AddProductController>(
          id: 'brand',
          builder: (c) => StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: databaseService.getBrands(),
            builder: (context, snapshot) {
              final state = handleSnapshot(snapshot);
              if (state != null) return state;
              final List<String> brand = extractCategoryNames(snapshot.data!);
              return SellerInputDD(
                validator:ProductLogic. validateBrand,
                hint: 'Select brand',
                icon: Icons.store_outlined,
                value: c.brand,
                items: brand,
                onChanged: c.setBrand,
              );
            },
          ),
        ),
      ],
    );
  }