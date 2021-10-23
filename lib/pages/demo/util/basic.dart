import 'dart:async';

import 'package:flutter/material.dart';


class TestDebouncePage extends StatefulWidget {
  const TestDebouncePage({Key? key}) : super(key: key);

  @override
  _TestDebouncePageState createState() => _TestDebouncePageState();
}

class _TestDebouncePageState extends State<TestDebouncePage> {

  Function debounce(
    Function func, [
    Duration delay = const Duration(milliseconds: 200),
  ]) {
    
    Timer? timer;
    Function target = () {
      if (timer?.isActive ?? false) {
        timer?.cancel();
      }
      timer = Timer(delay, () {
        func.call();
      });
    };
    return target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('debouncd'),
      ),
      body: Wrap(
        children: [
          buildElevatedButton()
        ],
      ),
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
          onPressed: () => debounce(() {}),
          child: Text('点击'),
        );
  }
}

class TestClass {
  final bbb, b;

  TestClass(this.bbb, this.b);
}
class Dfit extends StatelessWidget {
  const Dfit({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Container();
  }

}
