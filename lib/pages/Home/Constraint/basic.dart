import 'package:flutter/material.dart';

class ConstraintPage extends StatefulWidget {
  @override
  _ConstraintPageState createState() => _ConstraintPageState();
}

/// Container在没有子元素的时候，默认是上级约束的最大值， 有子元素就是子元素的尺寸
///
/// 如果Container设置了alignment，container约束的最大尺寸。
/// 如果在container外面包裹着一个Column，如果Container组件;高度就是 0；
///
///
class _ConstraintPageState extends State<ConstraintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Constraint(约束理解)'),
      ),
      body: _buildTestContainer(),
      // body: ListView(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: ElevatedButton(onPressed: () {}, child: Text('点击')),
      //     ),
      //     LayoutBuilder(
      //       builder: (context, constraints) {
      //         print(constraints);
      //         return Container(
      //           color: Colors.red,
      //           alignment: Alignment.center,
      //           width: 100,
      //           height: 120,
      //           // color: Colors.orange,
      //           child: LayoutBuilder(
      //             builder: (context, constraints) {
      //               print('maxHeight:${constraints.maxHeight}');
      //               print(constraints.minHeight);
      //               print(constraints.maxWidth);
      //               print(constraints.minWidth);
      //               return Padding(
      //                 padding: const EdgeInsets.all(0.0),
      //                 child: Container(
      //                   padding: EdgeInsets.all(20),
      //                   width: 60,
      //                   height: 60,
      //                   color: Colors.black,
      //                   child: Container(
      //                     color: Colors.blue,
      //                   ),
      //                 ),
      //               );
      //             },
      //           ),
      //           // child: Text('11'),
      //         );
      //       },
      //     ),
      //   ],
      // ),
    );
  }

  _buildTestContainer() {
    return Container(
      // height: 20,
      color: Colors.red,
      alignment: Alignment.center,
      child: Container(
        width: 200,
        height: 200,
        color: Colors.green,
      ),
    );
  }
}

/// Container的特点
/// 如果没有child，会默认占用约束的最大宽高
/// 如果有child，就是child的宽高
