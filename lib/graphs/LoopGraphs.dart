import 'dart:ui';
import 'package:flutter/material.dart';

class LoopGraphs extends CustomPainter {
  List<Offset> points;
  LoopGraphs(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(0, size.height * 2);
    canvas.scale(1, -1);

    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawPoints(PointMode.polygon, points, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
