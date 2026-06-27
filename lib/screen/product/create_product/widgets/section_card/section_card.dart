
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/get_x/product_section_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.tag,
    required this.title,
    required this.child,
  });

  final String tag;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final sc = Get.put(SectionCardController(), tag: tag);

    return GetBuilder<SectionCardController>(
      tag: tag,
      builder: (sc) => Container(
        decoration: BoxDecoration(
          color: AppColors.sellerSurfaceDeep,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.sellerBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
            GestureDetector(
              onTap: sc.toggle,
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 13),
                decoration: BoxDecoration(
                  color: sc.expanded
                      ? AppColors.sellerSurface
                      : AppColors.sellerSurfaceDeep,
                  borderRadius: sc.expanded
                      ? const BorderRadius.vertical(top: Radius.circular(13))
                      : BorderRadius.circular(13),
                ),
                child: Row(
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w700,
                        color: sc.expanded
                            ? AppColors.white
                            : AppColors.sellerWhite70,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: sc.expanded
                                ? [
                                    AppColors.sellerBorder,
                                    AppColors.transparent
                                  ]
                                : [
                                    AppColors.grey200
                                        .withValues(alpha: 0.60),
                                    AppColors.transparent,
                                  ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 250),
                      turns: sc.expanded ? 0.0 : -0.25,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 18,
                        color: sc.expanded
                            ? AppColors.sellerSubtitle
                            : AppColors.grey200,
                      ),
                    ),
                  ],
                ),
              ),
            ),

       
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 220),
              crossFadeState: sc.expanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Padding(
                padding: const EdgeInsets.all(16),
                child: child,
              ),
              secondChild: const SizedBox(width: double.infinity),
            ),
          ],
        ),
      ),
    );
  }
}