import 'package:choice_x_seller/screen/chat/messages.dart';
import 'package:choice_x_seller/screen/orders/orders.dart';
import 'package:choice_x_seller/screen/product/read_product/product.dart';
import 'package:choice_x_seller/screen/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/screen/seller_dashboard/seller_dashboard.dart';
import 'package:flutter/material.dart';
final List<Map<String, dynamic>> menuItems = [
  {
    'title': 'Dashboard',
    'icon': Icons.dashboard_rounded,
    'isExpanded': false,
    'navigation':(   bool isDesktop,
   bool isMobile,
   bool isTablet)=> DashboardScreen(isDesk: isDesktop,isMobile: isMobile,isTab: isTablet,),
    'children': [],
  },
  {
    'title': 'Products',
    'icon': Icons.widgets_rounded,
        'navigation':(   bool isDesktop,
   bool isMobile,
   bool isTablet)=> ProductScreen(isDesk: isDesktop,isMobile: isMobile,isTab: isTablet,),
        'children': [],
  },
  {
   
    'title': 'Messages',
    'icon': Icons.chat_rounded,
    'isExpanded': false,
    'navigation':(   bool isDesktop,
   bool isMobile,
   bool isTablet)=> MessagesScreen(),
    'children': [],
  },
  {
    'title': 'Orders',
    'icon': Icons.receipt_long_rounded,
    'isExpanded': false,
    'navigation':(   bool isDesktop,
   bool isMobile,
   bool isTablet)=> OrderScreen(isDesk: isDesktop,isMobile: isMobile,isTab: isTablet,),
    'children': [],
  },
  {
    'title': 'Returns',
    'icon': Icons.assignment_return_rounded,
    'isExpanded': false,
    'navigation':(   bool isDesktop,
   bool isMobile,
   bool isTablet)=> ReturnRequestScreen(isDesk: isDesktop,isMobile: isMobile,isTab: isTablet,),
    'children': [],
  },
  
];