import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/basic_details/basic_deails.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/bottom_bar/bottom_bar.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/category_and_type/category_and_type.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/connectivity_and_warrenty/connectivity_and_warreynty.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/description/description.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/header/desk_top_header.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/header/mobile_header.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/identifiers_and_time_line/time_line.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/physical_attributes/physical_attributes.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/product_images/images.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/section_card/section_card.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/variant/variant_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  late AddProductController c;
@override
void initState() {
  super.initState();

  if (!Get.isRegistered<AddProductController>()) {
    Get.put(AddProductController());
  }

  c = Get.find<AddProductController>();
  c.clearAll();
}
  @override
  void dispose() {
    c.clearAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.find<AddProductController>();

    return Dialog(
      backgroundColor: AppColors.sellerSurface,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final desktop = constraints.maxWidth > 600;
          final isMobile = constraints.maxWidth < 600;

          return SafeArea(
            child: Container(
             
              margin:
                  desktop ? const EdgeInsets.fromLTRB(10, 10, 10, 10) : null,
              decoration: BoxDecoration(
                borderRadius: desktop ? BorderRadius.circular(16) : null,
                color: AppColors.sellerSurfaceDeep,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: AppColors.sellerSurfaceDeep,
                      automaticallyImplyLeading: false,
                      expandedHeight: desktop ? 350 : 280,
                      collapsedHeight: 80,
                      forceElevated: false,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            desktop
                                ? const DesktopHeader()
                                : const MobileHeader(),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.black.withValues(alpha: 0.60),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: AppColors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: AppColors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Form(
                            key: c.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SectionCard(
                                  tag: 'basic',
                                  title: 'Basic Details',
                                  child: BasicDetails(c, isMobile: isMobile),
                                ),
                                const SizedBox(height: 12),
                                SectionCard(
                                  tag: 'desc',
                                  title: 'Description',
                                  child: Description(c),
                                ),
                                const SizedBox(height: 12),
                                SectionCard(
                                  tag: 'cat',
                                  title: 'Category & Type',
                                  child: CategoryType(c, isMobile: isMobile),
                                ),
                                const SizedBox(height: 12),
                                SectionCard(
                                  tag: 'variant',
                                  title: 'Variant',
                                  child: variantRow(context),
                                ),
                                const SizedBox(height: 12),
                                SectionCard(
                                  tag: 'conn',
                                  title: 'Connectivity & Warranty',
                                  child: Connectivity(c),
                                ),
                                const SizedBox(height: 12),
                                SectionCard(
                                  tag: 'phys',
                                  title: 'Physical Attributes',
                                  child: Physical(c, isMobile: isMobile),
                                ),
                                const SizedBox(height: 12),
                                SectionCard(
                                  tag: 'images',
                                  title: 'Product Images',
                                  child: images(context),
                                ),
                                const SizedBox(height: 12),
                                SectionCard(
                                  tag: 'timeline',
                                  title: 'Identifiers & Timeline',
                                  child: ProductTimeLine(c, context,
                                      isMobile: isMobile),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: bottomBar(context, c)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
