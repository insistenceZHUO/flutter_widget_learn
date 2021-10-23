import 'package:flutter/material.dart';

class StackPage extends StatefulWidget {
  @override
  _StackPageState createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack组件'),
      ),
      body: Container(
        color: Colors.green,
        child: Stack(
          // fit: StackFit.expand,
          alignment: Alignment.center,

          /// stack的尺寸是子元素的最大尺寸， stack在布局的时候。
          /// 子元素会分为有位置的widget和没有位置的widget，在stack中先会把没有位置的布局好。
          /// stack的大小会是没有位置子widget的最大尺寸。
          /// 如果子元素都是没有位置的，stack的尺寸就会越大越好。
          /// fit: StackFit.expand, 会把container最大约束传递给stack子widget中最大的尺寸。
          /// fit: StackFit.loose, 允许stack 尺寸为 0到最大范围的约束。
          /// fit: StackFit.passthrough, 会把stack上级约束传递给子iwidget
          // fit: StackFit.expand,
          children: [
            // Positioned(
            //     top: 0,
            //     left: 0,
            //     child: FlutterLogo(
            //       size: 250,
            //     )),
            Text('flutter------是一个跨平台框架'),
            Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                )),
            Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
            Container(
              width: 90,
              height: 90,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }
}
