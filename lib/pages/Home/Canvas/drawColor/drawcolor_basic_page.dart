import 'package:flutter/material.dart';

import '../coordinate.dart';
import 'dart:ui' as ui;

class DrawColorBasicPage extends StatefulWidget {
  const DrawColorBasicPage({Key? key}) : super(key: key);

  @override
  _DrawColorBasicPageState createState() => _DrawColorBasicPageState();
}

class _DrawColorBasicPageState extends State<DrawColorBasicPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: PaperPainter(),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  final Coordinate coordinate = Coordinate();

  late Paint _paint;

  final double strokeWidth = 0.5;
  final Color color = Colors.blue;

  PaperPainter() {
    _paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth
      ..color = color;
  }




  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);

    var colors = [
      Color(0xFFF60C0C),
      Color(0xFFF3B913),
      Color(0xFFE7F716),
      Color(0xFF3DF30B),
      Color(0xFF0DF6EF),
      Color(0xFF0829FB),
      Color(0xFFB709F4),
    ];

    var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];

    _paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, 0),
        colors, pos, TileMode.clamp);

    _paint.blendMode=BlendMode.lighten;

    canvas.drawPaint(_paint);
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}