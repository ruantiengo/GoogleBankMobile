import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_bank_mobile/shared/styles.dart';

class CurverPainter extends CustomPainter {
  const CurverPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(white);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.5);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
