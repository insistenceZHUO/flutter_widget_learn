import 'package:flutter/material.dart';

import '../coordinate.dart';

class ClipPathBasicPage extends StatefulWidget {
  const ClipPathBasicPage({Key? key}) : super(key: key);

  @override
  _ClipPathBasicPageState createState() => _ClipPathBasicPageState();
}

class _ClipPathBasicPageState extends State<ClipPathBasicPage> {
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
    Path path = Path();
    path.lineTo(80, 80);
    path.lineTo(-80, 80);
    path.close();
    canvas.clipPath(path);
    canvas.drawColor(Colors.red, BlendMode.darken);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
