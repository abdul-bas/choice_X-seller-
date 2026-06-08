
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/product/common/variant/decode_base_64.dart';
import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Container(
        height: 160,
        color: AppColors.sellerSurface,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.photo_library_outlined,
                  size: 32, color: AppColors.sellerStepInactive),
              SizedBox(height: 6),
              Text(
                'No images',
                style: TextStyle(
                    fontSize: 12, color: AppColors.sellerStepInactive),
              ),
            ],
          ),
        ),
      );
    }

    final m      = decodeBase64Image(images[0]);
    final thumbs = images.skip(1).take(3).toList();

    if (thumbs.isEmpty) {
      return SizedBox(
        height: 185,
        child: Container(
          color: AppColors.sellerSurface,
          child: m != null
              ? Image.memory(m, fit: BoxFit.cover, width: double.infinity)
              : const Center(
                  child: Icon(Icons.image_outlined,
                      size: 34, color: AppColors.sellerStepInactive)),
        ),
      );
    }

    return SizedBox(
      height: 185,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.sellerSurface,
              child: m != null
                  ? Image.memory(m, fit: BoxFit.cover)
                  : const Center(
                      child: Icon(Icons.image_outlined,
                          size: 34,
                          color: AppColors.sellerStepInactive)),
            ),
          ),
          Container(width: 1, color: AppColors.sellerBorder),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(3, (i) {
                final isLast   = i == 2;
                final hasThumb = i < thumbs.length;
                final bytes    = hasThumb ? decodeBase64Image(thumbs[i]) : null;
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.sellerSurface,
                      border: isLast
                          ? null
                          : const Border(
                              bottom: BorderSide(
                                  color: AppColors.sellerBorder)),
                    ),
                    child: bytes != null
                        ? Image.memory(bytes, fit: BoxFit.cover)
                        : hasThumb
                            ? const Center(
                                child: Icon(Icons.image_outlined,
                                    size: 14,
                                    color: AppColors.sellerStepInactive))
                            : null,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

}