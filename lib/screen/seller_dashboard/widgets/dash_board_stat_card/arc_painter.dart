
import 'dart:math' as math;

import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  const ArcPainter({required this.progress, required this.color});

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center      = Offset(size.width / 2, size.height / 2);
    final radius      = (size.width / 2) - 5;
    const strokeWidth = 10.0;
    const startAngle  = math.pi * 0.75;
    const sweepAngle  = math.pi * 1.5;

    
    final trackPaint = Paint()
      ..color = AppColors.white.withValues(alpha: 0.07) 
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle, sweepAngle, false, trackPaint,
    );

    
    if (progress > 0) {
      final progressPaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle * (progress / 100),
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(ArcPainter old) =>
      old.progress != progress || old.color != color;
}