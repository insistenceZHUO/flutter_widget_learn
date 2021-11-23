import 'package:flutter/material.dart';
import 'package:widget_details/pages/Home/Canvas/coordinate.dart';
import 'dart:ui' as ui;

class DrawPathBasicPage extends StatefulWidget {
  const DrawPathBasicPage({Key? key}) : super(key: key);

  @override
  _DrawPathBasicPageState createState() => _DrawPathBasicPageState();
}

class _DrawPathBasicPageState extends State<DrawPathBasicPage> {
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


    /// 创建一个路径;
    Path path = Path();
    path.lineTo(60, 60);
    path.lineTo(-60, 60);
    path.lineTo(60, -60);
    path.lineTo(-60, -60);
    path.close();
    canvas.drawPath(path, _paint);
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
//
// Path path = Path();
// path.lineTo(60, 60);
// path.lineTo(-60, 60);
// path.lineTo(60, -60);
// path.lineTo(-60, -60);
// path.close();
// canvas.drawPath(path, _paint);
// canvas.translate(140, 0);
// canvas.drawPath(
// path,
// _paint
// ..style = PaintingStyle.stroke
// ..strokeWidth = 2);
