import 'dart:ui';

import 'package:flutter/cupertino.dart';

/// 判空处理
bool isStrNullOrEmpty(String? str) {
  return str == null || str == '' || str.isEmpty;
}

extension StringExtension on String {
  Size sizeByTextStyle(TextStyle style) {
    if (isStrNullOrEmpty(this)) return Size(0, 0);
    TextPainter painter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: this, style: style));
    painter.layout();
    return painter.size;
  }

  Size sizeByFontSize(double fontSize) {
    if (isStrNullOrEmpty(this)) return Size(0, 0);
    TextPainter painter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: this, style: TextStyle(fontSize: fontSize)));
    painter.layout();
    return painter.size;
  }

  double widthByTextStyle(TextStyle style) {
    if (isStrNullOrEmpty(this)) return 0;
    TextPainter painter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: this, style: style),
        maxLines: 1);
    painter.layout();
    return painter.width;
  }

  double widthByFontSize(double fontSize) {
    if (isStrNullOrEmpty(this)) return 0;
    TextPainter painter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: this, style: TextStyle(fontSize: fontSize)),
        maxLines: 1);
    painter.layout();
    return painter.width;
  }

  double heightByTextStyle(TextStyle style, double maxWidth) {
    if (isStrNullOrEmpty(this)) return 0;
    TextPainter painter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(text: this, style: style),
    );
    painter.layout(maxWidth: maxWidth);
    return painter.height;
  }

  double heightByFontSize(double fontSize, double maxWidth) {
    if (isStrNullOrEmpty(this)) return 0;
    TextPainter painter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(text: this, style: TextStyle(fontSize: fontSize)),
    );
    painter.layout(maxWidth: maxWidth);
    return painter.height;
  }
}
