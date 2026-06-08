
  import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/screen/product/read_product/dialogs/delete_confirmation_dialog.dart';
import 'package:flutter/material.dart';


class ProductReadActionButtons extends StatelessWidget {
  const ProductReadActionButtons({
    super.key,
    required this.isLive,
    required this.product,
    required this.onDelete,
    required this.onEdit,
  });

  final bool isLive;
  final ProductModel product;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.sellerSurface,               
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          
          Expanded(
            child: SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: onEdit ?? () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.white,    
                  backgroundColor: AppColors.sellerBg,  
                  side: const BorderSide(
                    color: AppColors.sellerWhite24,   
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit, size: 18),
                    SizedBox(width: 6),
                    Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

         
          Expanded(
            child: SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: onDelete ??
                    () => showProductDeleteConfirmation(
                          context,
                          product,
                          onDelete,
                        ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.sellerBg, 
                  foregroundColor: AppColors.deleteRed,  
                  side: BorderSide(
                    color: AppColors.deleteRed.withValues(alpha: 0.3), 
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_rounded, size: 18),
                    SizedBox(width: 6),
                    Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}