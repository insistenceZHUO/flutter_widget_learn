import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CanvasGridPage extends StatelessWidget {
  const CanvasGridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var str1 = '12asda3';
    // var str2 = '123';
    // var str3 = '123456';
    // var str4 = '23.0';
    // var str5 = '-23556';
    // var str6 = 'dasda';
    // var str7 = '-235sdad56';
    // print("double.tryParse(str1) == null:${double.tryParse(str1) == null}");
    // print("double.tryParse(str2) == null:${double.tryParse(str2) == null}");
    // print("double.tryParse(str3) == null:${double.tryParse(str3) == null}");
    // print("double.tryParse(str4) == null:${double.tryParse(str4) == null}");
    // print("double.tryParse(str5) == null:${double.tryParse(str5) == null}");
    // print("double.tryParse(str6) == null:${double.tryParse(str6) == null}");
    // print("double.tryParse(str7) == null:${double.tryParse(str7) == null}");
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CustomPaint(
          size:size,
          painter: PaperPainter2(),
        ),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  late Paint _gridPint;
  final double step = 20;
  final double strokeWidth = .5;

  PaperPainter() {
    _gridPint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Colors.grey;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    // _drawGrid(canvas, size);
    _drawGrid(canvas, size);
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;
    _drawPart(canvas, paint);
    // _drawDot(canvas, paint);
  }

  void _drawPart(Canvas canvas, Paint paint) {
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

  void _drawDot(Canvas canvas, Paint paint) {
    final int count = 12;
    paint
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke;
    canvas.save();
    for (int i = 0; i < count; i++) {
      var step = 2 * pi / count;
      canvas.drawLine(Offset(80, 0), Offset(100, 0), paint);
      canvas.rotate(step);
    }
    canvas.restore();
  }

  void _drawGrid(Canvas canvas, Size size) {
    _drawBottomRight(canvas, size);

    canvas.save();
    canvas.scale(1, -1); // 沿x轴镜像
    _drawBottomRight(canvas, size);
    canvas.restore();
    // return;
    canvas.save();
    canvas.scale(-1, 1); // 沿y轴镜像
    _drawBottomRight(canvas, size);
    canvas.restore();
    canvas.save();
    canvas.scale(-1, -1); // 沿原点镜像
    _drawBottomRight(canvas, size);
    canvas.restore();
  }

  void _drawBottomRight(Canvas canvas, Size size) {
    canvas.save();
    for (int i = 0; i < size.height / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(size.width / 2, 0), _gridPint);
      canvas.translate(0, step);
    }
    canvas.restore();
    canvas.save();
    for (int i = 0; i < size.width / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(0, size.height / 2), _gridPint);
      canvas.translate(step , 0);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class PaperPainter2 extends CustomPainter {
  // PaperPainter2(){
  // }
  @override
  void paint(Canvas canvas, Size size) {
    /// 先把canvas的坐标移动到屏幕中间来;
    canvas.translate((size.width /2), size.height /2);
    /// 先画中间的圆;
    Paint _circlePrint = Paint()..color =Colors.blue..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(0, 0), 50, _circlePrint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
