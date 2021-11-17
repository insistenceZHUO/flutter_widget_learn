import 'package:flutter/material.dart';

class FlowBasicPage extends StatefulWidget {
  const FlowBasicPage({Key? key}) : super(key: key);

  @override
  _FlowBasicPageState createState() => _FlowBasicPageState();
}

class _FlowBasicPageState extends State<FlowBasicPage> {
  static const width = 80.0;
  static const height = 60.0;
  int maxLine = 2;
  int len = 10;

  bool isMore = true;

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (isMore) {
      maxLine = 2;
    } else {
      maxLine = 4;
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // setState(() {
          //   isMore = !isMore;
          // });
          setState(() {
            isMore = !isMore;
          });
        },
        child: Text('点击'),
      ),
      appBar: AppBar(
        title: Text('flow'),
      ),
      body: Flow(
        key: _globalKey,
        delegate: TestFlowDelegate(
          margin: EdgeInsets.only(left: 0, top: 0, bottom: 12, right: 12),
          element: context,
          maxLine: maxLine,
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: appColors.lightGray,
              color: Color(0xffF7F8FA1B),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text(
                    'sdsadsadsadad11sadasdad1',
                    style: TextStyle(fontSize: 14, height: 18 / 14),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: appColors.lightGray,
              color: Color(0xffF7F8FA1B),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text(
                    'sdsaadasdad1',
                    style: TextStyle(fontSize: 14, height: 18 / 14),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: appColors.lightGray,
              color: Color(0xffF7F8FA1B),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text(
                    'sdsadsadsadad',
                    style: TextStyle(fontSize: 14, height: 18 / 14),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF7F8FA1B),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text(
                    'sdsadsdasdadssssssasaddsad',
                    style: TextStyle(fontSize: 14, height: 18 / 14),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: appColors.lightGray,
              color: Color(0xffF7F8FA1B),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text(
                    'sdsadsadsadad',
                    style: TextStyle(fontSize: 14, height: 18 / 14),
                  ),
                ),
              ],
            ),
          ),
          // ...List.generate(
          //     8,
          //     (index) => Container(
          //           padding:
          //               EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             // color: appColors.lightGray,
          //             color: Color(0xffF7F8FA1B),
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               Container(
          //                 child: Text(
          //                   'sdsadsadsadad111',
          //                   style: TextStyle(fontSize: 14, height: 18 / 14),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         )),

          GestureDetector(
            onTap: () {
              setState(() {
                isMore = !isMore;
              });
            },
            child: Container(
              width: 28,
              height: 28,
              color: Colors.red,
              child: Text('${isMore ? '展开' : '收起'}'),
            ),
          )
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  final BuildContext element;
  final int maxLine;

  TestFlowDelegate(
      {required this.maxLine, required this.margin, required this.element});

  @override
  void paintChildren(FlowPaintingContext context) {
    var more = 28;
    var x = margin.left;
    var y = margin.top;

    var minLine = 0;

    for (int i = 0; i < context.childCount; i++) {
      var width1 = context.getChildSize(i)!.width + x + margin.right;
      if (width1 + more < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = width1 + margin.left;
      } else {
        var width1 = context.getChildSize(i)!.width + x + margin.right;
        var nextX = width1 + margin.left;
        var width2;
        if (i < context.childCount - 1) {
          width2 = context.getChildSize(i + 1)!.width + nextX + margin.right;
        }
        if (width2 + more > context.size.width) {
          minLine++;
        }
        if (minLine >= maxLine) {
          return context.paintChild(context.childCount - 1,
              transform: new Matrix4.translationValues(x, y, 0.0));
        }
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
