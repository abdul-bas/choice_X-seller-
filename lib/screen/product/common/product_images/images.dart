import 'dart:convert';
import 'dart:typed_data';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

Widget images(BuildContext context) {
  return GetBuilder<AddProductController>(
    builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.sellerSurface,
              border: Border.all(color: AppColors.sellerBorder),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...controller.images.asMap().entries.map((e) {
                    final Uint8List bytes = base64Decode(e.value);
                    return SizedBox(
                      width: 88,
                      height: 88,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.memory(bytes,
                                width: 88, height: 88, fit: BoxFit.cover),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () => controller.removeImage(e.key),
                              child: const CircleAvatar(
                                backgroundColor: AppColors.danger,
                                radius: 10,
                                child: Icon(Icons.close,
                                    color: AppColors.white, size: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(
                    width: 88,
                    height: 88,
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/icon/image.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.sellerSurfaceDeep,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.sellerSurfaceDeep,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: AppColors.sellerBorder),
                        ),
                      ),
                      onPressed: () => controller.fileUplod(context),
                      icon: const Icon(Icons.upload,
                          color: AppColors.sellerWhite54, size: 18),
                      label: const Text(
                        'Upload Images',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.sellerWhite54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
