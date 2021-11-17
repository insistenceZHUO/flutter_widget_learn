import 'package:flutter/material.dart';

class PaintBasicPage extends StatefulWidget {
  const PaintBasicPage({Key? key}) : super(key: key);

  @override
  _PaintBasicPageState createState() => _PaintBasicPageState();
}

class _PaintBasicPageState extends State<PaintBasicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('认识paint12'),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        // color: Colors.blue,
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
    // drawIsAntiAliasColor(canvas);
    // drawStyleStrokeWidth(canvas);
    // drawStrokeCap(canvas);
    drawStrokeJoin(canvas);
  }

  // 测试 isAntiAlias 和 color属性
  void drawIsAntiAliasColor(Canvas canvas) {
    /// 创建一个画笔;
    Paint paint = Paint();

    /// 画一个圆，颜色为蓝色，线宽为是5;
    canvas.drawCircle(
        Offset(180, 180),
        170,
        paint
          ..color = Colors.blue
          ..strokeWidth = 5);
    canvas.drawCircle(
        Offset(180, 180 + 360.0),
        170,
        paint
          ..isAntiAlias = false
          ..color = Colors.red);
  }

  // 测试 style 和 strokeWidth 属性
  void drawStyleStrokeWidth(Canvas canvas) {
    Paint paint = Paint()..color = Colors.red;
    canvas.drawCircle(
        Offset(180, 180),
        150,
        paint
          ..style = PaintingStyle.fill
          ..strokeWidth = 50);
    canvas.drawCircle(
        Offset(180 + 360.0, 180),
        150,
        paint
          ..strokeWidth = 50
          ..style = PaintingStyle.fill);
    //测试线
    canvas.drawLine(
        Offset(0, 180 - 150.0),
        Offset(1600, 180 - 150.0),
        paint
          ..strokeWidth = 5
          ..color = Colors.blueAccent
          ..style);
  }

  /// 线帽类型; strokeCap
  /// StrokeCap.butt - 不出头
  /// StrokeCap.round - 圆头
  /// StrokeCap.square - 方头
  void drawStrokeCap(Canvas canvas) {
    /// 创建一个画笔;
    Paint _paint = Paint();
    _paint
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    canvas.drawLine(
        Offset(50, 50), Offset(50, 150), _paint..strokeCap = StrokeCap.butt);
    canvas.drawLine(Offset(50 + 50.0, 50), Offset(50 + 50.0, 150),
        _paint..strokeCap = StrokeCap.round);
    canvas.drawLine(Offset(50 + 50.0 * 2, 50), Offset(50 + 50.0 * 2, 150),
        _paint..strokeCap = StrokeCap.square);
  }

  ///  线接类型strokeJoin
  ///  StrokeJoin.bevel - 斜角、
  ///  StrokeJoin.miter - 锐角、
  ///  StrokeJoin.round - 圆角
  void drawStrokeJoin(Canvas canvas) {
    Paint paint =  Paint();
    Path path =  Path();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 20;
    path.moveTo(50, 50);
    path.lineTo(50, 150);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin = StrokeJoin.bevel);

    // path.reset();
    // path.moveTo(50 + 150.0, 50);
    // path.lineTo(50 + 150.0, 150);
    // path.relativeLineTo(100, -50);
    // path.relativeLineTo(0, 100);
    // canvas.drawPath(path, paint..strokeJoin = StrokeJoin.miter);

    // path.reset();
    // path.moveTo(50 + 150.0 * 2, 50);
    // path.lineTo(50 + 150.0 * 2, 150);
    // path.relativeLineTo(100, -50);
    // path.relativeLineTo(0, 100);
    // canvas.drawPath(path, paint..strokeJoin = StrokeJoin.round);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// class PaperPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     /// 创建一个画笔;
//     // Paint _paint = Paint();
//     // canvas.drawCircle(Offset(180, 180), 170, _paint..color = Colors.blue..strokeWidth = 6);
//     drawIsAntiAliasColor(canvas);
//
//   }
//
//   void drawIsAntiAliasColor(Canvas canvas) {
//     Paint paint = Paint();
//     canvas.drawCircle(
//         Offset(180, 180),
//         170,
//         paint
//           ..color = Colors.blue
//           ..strokeWidth = 5);
//     canvas.drawCircle(
//         Offset(180 + 360.0, 180),
//         170,
//         paint
//           ..isAntiAlias = false
//           ..color = Colors.red);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
//
// }
