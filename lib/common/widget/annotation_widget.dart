import 'package:flutter/material.dart';

class AnnotationWidget extends StatelessWidget {
  final String text;
  final Color color;

  const AnnotationWidget({Key? key, required this.text, this.color = Colors.yellow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20,vertical: 20 ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // width: double.infinity,
        color: color,
        child: Text(text),
      ),
    );
  }
}
