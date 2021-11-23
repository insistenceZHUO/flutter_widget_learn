import 'package:flutter/material.dart';

import '../coordinate.dart';
import 'dart:ui' as ui;

class ClipRRectBasicPage extends StatefulWidget {
  const ClipRRectBasicPage({Key? key}) : super(key: key);

  @override
  _ClipRRectBasicPageState createState() => _ClipRRectBasicPageState();
}

class _ClipRRectBasicPageState extends State<ClipRRectBasicPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: PaperPainter(),
      ),
      // child: ,
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
    // Rect rectFromCenter = Rect.fromCenter(center: Offset.zero, width: 200, height: 100);
    // canvas.drawRRect(RRect.fromRectAndRadius(rectFromCenter, Radius.circular(20)), _paint..color= Colors.red);
    // canvas.drawColor(Colors.red, BlendMode.darken);

    var rect = Rect.fromCenter(center: Offset.zero,width: 200,height: 100);
    canvas.clipRRect(RRect.fromRectAndRadius(rect, Radius.circular(30)));

    canvas.drawColor(Colors.red, BlendMode.darken);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}