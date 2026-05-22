import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:flutter/material.dart';


void showProductDeleteConfirmation(
  BuildContext context,
  ProductModel product,
  VoidCallback? onDelete,
) {
  showDialog(
    context: context,
    barrierColor: AppColors.overlayBarrier,          
    builder: (context) => _ProductDeleteDialog(
      product: product,
      onDelete: onDelete,
    ),
  );
}

class _ProductDeleteDialog extends StatelessWidget {
  const _ProductDeleteDialog({
    required this.product,
    required this.onDelete,
  });

  final ProductModel product;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite,              
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowDialog,          
                blurRadius: 40,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
           
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 28),
                decoration: const BoxDecoration(
                  color: AppColors.deleteRed,           
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        color: AppColors.sellerWhite10, 
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.delete_sweep_rounded,
                        color: AppColors.white,        
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Delete Product',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppColors.white,       
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),

              
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.deleteRedSubtle, 
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.deleteRedBorder, 
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.inventory_2_outlined,
                            size: 16,
                            color: AppColors.deleteRed,   
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              product.productName,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.deleteRed,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'This product will be permanently removed and cannot be recovered.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.grey500,         
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),

                   
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.deleteCancelBg,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.deleteCancelText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              if (onDelete != null) onDelete!();
                            },
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.deleteRed,   
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.deleteRed
                                        .withValues(alpha: 0.35),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete_rounded,
                                    size: 15,
                                    color: AppColors.white,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Delete',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white, 
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}