import 'package:drawing_app/models/pen_stroke_model.dart';
import 'package:flutter/material.dart';

class DrawPen extends CustomPainter {
  List<PenStroke> points;
  DrawPen({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        Paint paint = Paint()
          ..color = points[i].color
          ..strokeCap = points[i].strokeCap
          ..strokeWidth = points[i].brushWidth;
        canvas.drawLine(points[i].offset, points[i + 1].offset, paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawPen oldDelegate) => oldDelegate.points != points;
}
