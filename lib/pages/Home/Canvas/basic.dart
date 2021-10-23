import 'package:flutter/material.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({Key? key}) : super(key: key);

  @override
  _CanvasPageState createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  var paint = CustomPaint(
    size: Size(100,100),
    painter: MyPainter(),
  );
  var _painterFillCircle = CustomPaint(
    size: Size(100,100),
    painter: PainterFillCircle(),
  );

  var _myPaintBasice = CustomPaint(
    size: Size(100, 100),
    painter: PainterBasic(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('canvas'),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: paint),

          Container(
            alignment: Alignment.center,
            child: _myPaintBasice,
          ),   Container(
            alignment: Alignment.center,
            child: _painterFillCircle,
          )
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
       Rect rect = Offset.zero & size;
       canvas.save();
       canvas.clipRRect(new RRect.fromRectXY(rect, 50.0, 50.0));
       canvas.saveLayer(rect, Paint());
       canvas.drawPaint(new Paint()..color = Colors.red);
       canvas.drawPaint(new Paint()..color = Colors.blue);
       canvas.restore();
       canvas.restore();
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}


/// 绘制一个圆
class PainterBasic extends CustomPainter{
  late Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    /// 第一步：创建一个画笔;
    _paint = Paint();

    ///
    _paint.color = Colors.red;

    /// 设置一个类型;画笔是要填充还是要描边;
    _paint.style = PaintingStyle.stroke; // 设置描边

    /// 设置描边的宽度;
    _paint.strokeWidth = 5;

    /// 绘制一个圆;
    canvas.drawCircle(Offset(size.width /2, size.height /2), size.width /2, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// 绘制一个实心圆;

class PainterFillCircle extends CustomPainter {

  late Paint _paint;
  @override
  void paint(Canvas canvas, Size size) {
    /// 创建一个画笔;
    _paint = Paint();

    _paint.color = Colors.red;
    _paint.style = PaintingStyle.fill;
    _paint.strokeWidth = 5;
    /// 绘制一个圆;
    canvas.drawCircle(Offset(size.width /2, size.height /2), size.width /2, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}