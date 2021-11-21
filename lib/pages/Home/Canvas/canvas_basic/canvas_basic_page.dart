import 'package:flutter/material.dart';
import 'package:wd_common_package/wd_common_package.dart';

class CanvasBasicPage extends StatefulWidget {
  const CanvasBasicPage({Key? key}) : super(key: key);

  @override
  _CanvasBasicPageState createState() => _CanvasBasicPageState();
}

class _CanvasBasicPageState extends State<CanvasBasicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: CustomPaint(
          painter: PaperPainter(),
        ),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    logger.d("size.width:${size.width}");
    logger.d("size.height:${size.height}");
    ///创建一个画笔;
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;
    // 画布起点移到屏幕中心
    canvas.translate(0, 0);
    canvas.drawCircle(Offset(0, 0), 50, paint);
    canvas.drawLine(
        Offset(20, 20),
        Offset(50, 50),
        paint
          ..color = Colors.red
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
