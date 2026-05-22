import 'package:flutter/material.dart';

Color getOrderStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return Colors.orange;

    case 'confirmed':
      return Colors.blue;

    case 'shipped':
      return Colors.purple;

    case 'delivered':
      return Colors.green;

    case 'cancelled':
      return Colors.red;

    default:
      return Colors.grey;
  }
}