import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/section_card.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/common/submit_button.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/desk_top/form_section.dart';
import 'package:choice_x_seller/screen/product/common/basic_details/basic_deails.dart';
import 'package:choice_x_seller/screen/product/common/category_and_type/category_and_type.dart';
import 'package:choice_x_seller/screen/product/common/connectivity_and_warrenty/connectivity_and_warreynty.dart';
import 'package:choice_x_seller/screen/product/common/description/description.dart';
import 'package:choice_x_seller/screen/product/common/identifiers_and_time_line/time_line.dart';
import 'package:choice_x_seller/screen/product/common/physical_attributes/physical_attributes.dart';
import 'package:choice_x_seller/screen/product/common/product_images/images.dart';
import 'package:choice_x_seller/screen/product/common/variant/variant_row.dart';

import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({super.key, required this.c, required this.isMobile,required this.isCreate});
  final AddProductController c;
  final bool isMobile;
  final bool isCreate;
  


  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sellerSurface,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 16 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FormSection(
              title: 'Core Info',
              icon: Icons.info_outline_rounded,
              children: [
                SectionCard(
                  tag: 'basic',
                  title: 'Basic Details',
                  child: BasicDetails(c, isMobile: isMobile),
                ),
                SectionCard(
                  tag: 'desc',
                  title: 'Description',
                  child: Description(c),
                ),
                SectionCard(
                  tag: 'cat',
                  title: 'Category & Type',
                  child: CategoryType(c, isMobile: isMobile),
                ),
              ],
            ),
            const SizedBox(height: 8),
            FormSection(
              title: 'Product Details',
              icon: Icons.inventory_2_outlined,
              children: [
                SectionCard(
                  tag: 'variant',
                  title: 'Variants',
                  child:GetBuilder<AddProductController>(
      id: 'variant',
      builder: (_) => variantRow(context),
    ),
                ),
                SectionCard(
                  tag: 'conn',
                  title: 'Connectivity & Warranty',
                  child: Connectivity(c),
                ),
                SectionCard(
                  tag: 'phys',
                  title: 'Physical Attributes',
                  child: Physical(c, isMobile: isMobile),
                ),
              ],
            ),
            const SizedBox(height: 8),
            FormSection(
              title: 'Media & Meta',
              icon: Icons.perm_media_outlined,
              children: [
                SectionCard(
                  tag: 'images',
                  title: 'Product Images',
                  child: GetBuilder<AddProductController>(
      id: 'images',
      builder: (_) => images(context),
    ),
                ),
                SectionCard(
                  tag: 'timeline',
                  title: 'Identifiers & Timeline',
                  child: ProductTimeLine(c, context, isMobile: isMobile),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SubmitButton(c: c,isCreate: isCreate,),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
