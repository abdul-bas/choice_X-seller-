
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/app_bar_config/app_bar_config.dart';
import 'package:flutter/material.dart';
class AppBarConfigs {
  static const dashboard = AppBarConfig(
    title: 'Dashboard',
    subtitle: 'Monitor sales, orders and store performance',
    icon: Icons.dashboard_outlined,
    accent: AppColors.appBarAccentDashboard,
    searchHint: null,
    addLabel: null,
  );

  static const products = AppBarConfig(
    title: 'Products',
    subtitle: 'Manage your products and stock availability',
    icon: Icons.inventory_2_outlined,
    accent: AppColors.appBarAccentProducts,
    searchHint: 'Search products...',
    addLabel: '+ Add product',
  );

  static const orders = AppBarConfig(
    title: 'Orders',
    subtitle: 'Track and manage customer orders',
    icon: Icons.receipt_long_outlined,
    accent: AppColors.appBarAccentOrders,
    searchHint: 'Search orders...',
    addLabel: null,
  );

  static const messages = AppBarConfig(
    title: 'Messages',
    subtitle: 'Respond to customer inquiries quickly',
    icon: Icons.message_outlined,
    accent: AppColors.appBarAccentMessages,
    searchHint: 'Search messages...',
    addLabel: null,
  );

  static const returns = AppBarConfig(
    title: 'Returns',
    subtitle: 'Handle return requests and refunds',
    icon: Icons.assignment_return_outlined,
    accent: AppColors.appBarAccentReturns,
    searchHint: 'Search returns...',
    addLabel: null,
  );
}