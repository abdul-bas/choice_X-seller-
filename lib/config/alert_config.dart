

import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';



class AlertDialogConfig {
  const AlertDialogConfig({
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.confirmColor = AppColors.danger,
    this.icon = Icons.warning_rounded,
    this.iconColor = AppColors.warningIcon,
    this.showCancelButton = true,
    this.barrierDismissible = true,
  });

  final String title;
  final String content;
  final VoidCallback onConfirm;
  final String confirmText;
  final String cancelText;
  final Color confirmColor;
  final Color iconColor;
  final IconData icon;
  final bool showCancelButton;
  final bool barrierDismissible;


  static AlertDialogConfig delete({
    required VoidCallback onConfirm,
    String title = 'Delete Item',
    String content = 'This action cannot be undone.',
  }) => AlertDialogConfig(
    title: title, content: content, onConfirm: onConfirm,
    confirmText: 'Delete', confirmColor: AppColors.danger,
    icon: Icons.delete_outline_rounded, iconColor: AppColors.danger,
  );

  static AlertDialogConfig logout({
    required VoidCallback onConfirm,
    String title = 'Logout',
    String content = 'Are you sure you want to sign out?',
  }) => AlertDialogConfig(
    title: title, content: content, onConfirm: onConfirm,
    confirmText: 'Logout', confirmColor: AppColors.sellerAccent,
    icon: Icons.logout_rounded, iconColor: AppColors.sellerAccent,
  );

  static AlertDialogConfig warning({
    required String title,
    required String content,
    required VoidCallback onConfirm,
    String confirmText = 'Proceed',
  }) => AlertDialogConfig(
    title: title, content: content, onConfirm: onConfirm,
    confirmText: confirmText, confirmColor: AppColors.warningMid,
    icon: Icons.warning_amber_rounded, iconColor: AppColors.warningIcon,
  );

  static AlertDialogConfig success({
    required String title,
    required String content,
    required VoidCallback onConfirm,
    String confirmText = 'OK',
  }) => AlertDialogConfig(
    title: title, content: content, onConfirm: onConfirm,
    confirmText: confirmText, confirmColor: AppColors.success,
    icon: Icons.check_circle_outline_rounded, iconColor: AppColors.successIcon,
    showCancelButton: false,
  );
}

