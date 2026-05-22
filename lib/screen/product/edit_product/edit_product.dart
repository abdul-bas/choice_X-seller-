import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/screen/product/edit_product/widget/edit_mode_badge.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/basic_details/basic_deails.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/category_and_type/category_and_type.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/connectivity_and_warrenty/connectivity_and_warreynty.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/description/description.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/identifiers_and_time_line/time_line.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/physical_attributes/physical_attributes.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/product_images/images.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/section_card/section_card.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/variant/variant_row.dart';
import 'package:choice_x_seller/screen/product/edit_product/widget/edit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<EditProductScreen> createState() => _EditProductState();
}

class _EditProductState extends State<EditProductScreen> {
  final formKey = GlobalKey<FormState>();
  late AddProductController c;

  @override
  void initState() {
    super.initState();
    c = Get.find<AddProductController>();
    c.clearAll();
    c.initFromProduct(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    final size     = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Dialog(
        backgroundColor: AppColors.transparent,
        insetPadding: EdgeInsets.symmetric(
          horizontal: isMobile ? 0 : 24,
          vertical:   isMobile ? 0 : 20,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth:  isMobile ? double.infinity : 720,
            maxHeight: isMobile ? size.height : size.height * 0.92,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.sellerSurfaceDeep,
              borderRadius: BorderRadius.circular(isMobile ? 28 : 24),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.07),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.85),
                  blurRadius: 60,
                  offset: const Offset(0, 24),
                ),
                BoxShadow(
                  color: AppColors.white.withValues(alpha: 0.03),
                  blurRadius: 0,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isMobile ? 28 : 24),
              child: CustomScrollView(
                slivers: [
                
                  SliverAppBar(
                    pinned: true,
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColors.sellerSurfaceDeep,
                    surfaceTintColor: AppColors.transparent,
                    expandedHeight: 0,
                    toolbarHeight: 0,
                    flexibleSpace: const SizedBox.shrink(),
                  ),

               
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        Container(
                          height: isMobile ? 160 : 200,
                          decoration: const BoxDecoration(
                            color: AppColors.sellerSurfaceDeep,
                          ),
                        ),
                        // Decorative circles
                        Positioned(
                          top: -40,
                          right: -40,
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white.withValues(alpha: 0.03),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 60,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white.withValues(alpha: 0.02),
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            isMobile ? 20 : 28,
                            isMobile ? 24 : 32,
                            isMobile ? 20 : 28,
                            isMobile ? 20 : 28,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                               
                                  EditModeBadge(),

                                  GestureDetector(
                                    onTap: () =>
                                        Navigator.of(context).pop(),
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: AppColors.white
                                            .withValues(alpha: 0.07),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.close_rounded,
                                        size: 15,
                                        color: AppColors.white
                                            .withValues(alpha: 0.60),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: isMobile ? 16 : 20),
                              Text(
                                widget.product.productName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: isMobile ? 22 : 28,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(
                                    Icons.edit_note_rounded,
                                    size: 13,
                                    color: AppColors.white
                                        .withValues(alpha: 0.35),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Update product details below',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.white
                                          .withValues(alpha: 0.35),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  
                  SliverToBoxAdapter(
                    child: Container(
                      height: 1,
                      color: AppColors.white.withValues(alpha: 0.06),
                    ),
                  ),

               
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      isMobile ? 14 : 20,
                      16,
                      isMobile ? 14 : 20,
                      8,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Form(
                        key: formKey,
                        child: Column(
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
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),

                  
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: AppColors.sellerSurfaceDeep,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(16)),
                      ),
                      child: editBottomBar(
                        context,
                        formKey,
                        widget.product,
                        c,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
