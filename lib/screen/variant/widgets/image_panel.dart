import 'dart:convert';
import 'dart:typed_data';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/get_x/variant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ImagePanel extends StatelessWidget {
  const ImagePanel({super.key});

  @override
  Widget build(BuildContext context) =>
      GetBuilder<VariantController>(builder: (ctrl) {
        return Container(
          decoration: BoxDecoration(
            color:        AppColors.variantSurfaceMid,
            borderRadius: BorderRadius.circular(16),
            border:       Border.all(color: AppColors.variantBorder),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(children: [
            // Thumbnail strip
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (i) {
                final isActive = ctrl.activeImage == i;
                final hasImage = i < ctrl.variantImages.length &&
                    ctrl.variantImages[i].isNotEmpty;
                final Uint8List? bytes =
                    hasImage ? base64Decode(ctrl.variantImages[i]) : null;

                return GestureDetector(
                  onTap: () => ctrl.setActiveImage(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    width:  48,
                    height: 48,
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: hasImage
                          ? DecorationImage(
                              image: MemoryImage(bytes!),
                              fit: BoxFit.cover,
                            )
                          : null,
                      color: hasImage
                          ? AppColors.variantThumbActiveBg
                          : AppColors.variantSurface,
                    ),
                    child: hasImage
                        ? null
                        : Icon(
                            Icons.add_rounded,
                            size:  16,
                            color: isActive
                                ? AppColors.white
                                : AppColors.variantLabelDeep,
                          ),
                  ),
                );
              }),
            ),
            const SizedBox(width: 10),
            // Main preview
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color:        AppColors.variantSurface,
                  borderRadius: BorderRadius.circular(12),
                  image: ctrl.variantImages[ctrl.activeImage ?? 0].isNotEmpty
                      ? DecorationImage(
                          image: MemoryImage(
                            base64Decode(
                                ctrl.variantImages[ctrl.activeImage ?? 0]),
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                  border: Border.all(
                    color: (ctrl.activeImage != null &&
                            ctrl.variantImages[ctrl.activeImage!].isNotEmpty)
                        ? AppColors.variantThumbActiveBorder
                        : AppColors.variantBorder,
                  ),
                ),
                child: ctrl.variantImages[ctrl.activeImage ?? 0].isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color:  AppColors.variantImageCircleBg,
                              shape:  BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.image_rounded,
                              size:  36,
                              color: AppColors.variantImageIconColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Image ${(ctrl.activeImage! + 1)} selected',
                            style: const TextStyle(
                              fontSize: 11,
                              color:    AppColors.variantLabelMuted,
                            ),
                          ),
                        ],
                      )
                    : null,
              ),
            ),
          ]),
        );
      });
}
