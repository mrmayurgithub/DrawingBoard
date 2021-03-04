import 'package:drawing_app/pointColor_model/pointColor_model.dart';
import 'package:flutter/material.dart';

class Draw extends CustomPainter {
  List<pointColor> points;
  Draw({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        Paint paint = Paint()
          ..color = points[i].color
          ..strokeCap = StrokeCap.round
          ..strokeWidth = points[i].brushWidth;
        canvas.drawLine(points[i].offset, points[i + 1].offset, paint);
      }
    }
  }

  @override
  bool shouldRepaint(Draw oldDelegate) => oldDelegate.points != points;
}
