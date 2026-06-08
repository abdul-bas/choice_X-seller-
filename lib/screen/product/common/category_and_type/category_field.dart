import 'package:choice_x_seller/core/utils/firestore_helpers/extract_category_names.dart';
import 'package:choice_x_seller/core/utils/firestore_helpers/stream.dart';
import 'package:choice_x_seller/screen/product/controller/controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/label/label.dart';
import 'package:choice_x_seller/services/db_service/database_service.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/common/input_fields/seller_input_dd.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

  Widget categoryField(DatabaseService databaseService) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Category'),
        GetBuilder<AddProductController>(
          id: 'category',
          builder: (c) =>
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: databaseService.getCategories(),
            builder: (context, snapshot) {
              final state = handleSnapshot(snapshot);
              if (state != null) return state;
              final List<String> categories =
                  extractCategoryNames(snapshot.data!);
              return SellerInputDD(
                validator:ProductLogic. validateCategory,
                hint: 'Select category',
                icon: Icons.category_outlined,
                value: c.category,
                items: categories,
                onChanged: c.setCategory,
              );
            },
          ),
        ),
      ],
    );
  }
