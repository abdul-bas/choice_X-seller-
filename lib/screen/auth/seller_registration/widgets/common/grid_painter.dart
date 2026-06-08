import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const step = 32.0;

    final line = Paint()
      ..color = AppColors.sellerGridLine    
      ..strokeWidth = 1;

    final dot = Paint()
      ..color = AppColors.sellerGridDot    
      ..style = PaintingStyle.fill;

    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), line);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), line);
    }
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 1.1, dot);
      }
    }
  }

  @override
  bool shouldRepaint(GridPainter _) => false;
}