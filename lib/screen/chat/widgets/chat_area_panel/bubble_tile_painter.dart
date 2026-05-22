import 'package:flutter/material.dart';

class BubbleTailPainter extends CustomPainter {
  const BubbleTailPainter({
    required this.isSender,
    required this.color,
  });

  final bool isSender;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const tailW = 7.0;
    const tailH = 8.0;
    const r = 18.0;

    final paint = Paint()..color = color;
    final path = Path();

    if (isSender) {
     
      path.moveTo(size.width - r, size.height);
      path.lineTo(size.width + tailW, size.height + tailH);
      path.lineTo(size.width - r + tailW, size.height);
      path.close();
    } else {
      
      path.moveTo(r, size.height);
      path.lineTo(-tailW, size.height + tailH);
      path.lineTo(r - tailW, size.height);
      path.close();
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BubbleTailPainter old) =>
      old.isSender != isSender || old.color != color;
}