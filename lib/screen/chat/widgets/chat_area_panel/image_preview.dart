
import 'dart:typed_data';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview(
      {super.key, required this.bytes, required this.onRemove});
  final Uint8List bytes;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.chatBubbleReceiver,               
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.sellerBorder),   
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.memory(bytes, height: 110, fit: BoxFit.cover),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(                             
              onPressed: onRemove,
              padding: const EdgeInsets.all(3),
              iconSize: 12,
              icon: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: AppColors.black,                  
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close,
                    size: 12, color: AppColors.white),      
              ),
            ),
          ),
        ],
      ),
    );
  }
}