import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

import '../coordinate.dart';

class DrawImageBasicPage extends StatefulWidget {
  const DrawImageBasicPage({Key? key}) : super(key: key);

  @override
  _DrawImageBasicPageState createState() => _DrawImageBasicPageState();
}

class _DrawImageBasicPageState extends State<DrawImageBasicPage> {
  late ui.Image _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async {
    _image = await loadImageFromAssets('assets/images/right_chat.png');
    setState(() {});
  }

  Future<ui.Image> loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    Uint8List bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    return decodeImageFromList(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white, child: CustomPaint(painter: PaperPainter(_image)));
  }
}

class PaperPainter extends CustomPainter {
  late Paint _paint;

  final double strokeWidth = 0.5;
  final Color color = Colors.blue;

  final ui.Image image;
  final Coordinate coordinate = Coordinate();

  PaperPainter(this.image) {
    _paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth
      ..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    // canvas.translate(size.width / 2, size.height / 2);
    // _drawImage(canvas);
    // _drawImageRect(canvas);
    _drawImageNine(canvas);
  }

  @override
  bool shouldRepaint(PaperPainter oldDelegate) => image != oldDelegate.image;

  void _drawImage(Canvas canvas) {
    if (image != null) {
      canvas.drawImage(
          image, Offset(-image.width / 2, -image.height / 2), _paint);
      // canvas.drawImage(image, Offset(0, 0), _paint);
    }
  }

  void _drawImageRect(Canvas canvas) {
    if (image != null) {
      canvas.drawImageRect(
          image,
          Rect.fromCenter(
              center: Offset(0, 0), width: 400, height: 400),
          Rect.fromLTRB(0, 0, 200, 200).translate(0, 0),
          _paint);

      // canvas.drawImageRect(
      //     image,
      //     Rect.fromCenter(
      //         center: Offset(image.width/2, image.height/2-60), width: 60, height: 60),
      //     Rect.fromLTRB(0, 0, 100, 100).translate(-280, -100),
      //     _paint);
      //
      // canvas.drawImageRect(
      //     image,
      //     Rect.fromCenter(
      //         center: Offset(image.width/2+60, image.height/2), width: 60, height: 60),
      //     Rect.fromLTRB(0, 0, 100, 100).translate(-280, 50),
      //     _paint);
    }
  }

  void _drawImageNine(Canvas canvas) {
    if (image != null) {
      canvas.drawImageNine(
          image,
          Rect.fromCenter(center: Offset(image.width / 2, image.height-6.0),
              width: image.width-20.0, height: 2.0),
          Rect.fromCenter(center: Offset(0, 0,), width:300, height: 120),
          _paint);
      //
      // canvas.drawImageNine(
      //     image,
      //     Rect.fromCenter(center: Offset(image.width/2, image.height-6.0),
      //         width: image.width - 20.0, height: 2.0),
      //     Rect.fromCenter(center: Offset(0, 0,), width:100, height: 50).translate(250, 0),
      //     _paint);
      //
      // canvas.drawImageNine(
      //     image,
      //     Rect.fromCenter(center: Offset(image.width/2, image.height-6.0),
      //         width: image.width-20.0, height: 2.0),
      //     Rect.fromCenter(center: Offset(0, 0,), width:80, height: 250).translate(-250, 0),
      //     _paint);
    }
  }
}
