import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  @override
  _ScaffoldPageState createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('scaffold'),
      ), // 页面上方导航条
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: Text('floatingActionButton'),
      ),
      // 可以是任意的widget 一个悬浮的按钮
      // floatingActionButtonLocation: , // 悬浮按钮位置
      // floatingActionButtonAnimator: , // 悬浮按钮动画
      persistentFooterButtons: [
        RawChip(
          label: Text('persistentFooterButtons'),
        ),
        RawChip(
          label: Text('persistentFooterButtons'),
        ),
      ], // 显示在底部导航条上方的一组按钮
      // primary: false, // 是否在顶部显示appbar
      drawerDragStartBehavior: DragStartBehavior.start,
      // resizeToAvoidBottomPadding: ture,
      drawer: Drawer(), // 左侧菜单
      endDrawer: Drawer(), // 右侧菜单
      drawerEnableOpenDragGesture: false, // 左侧侧滑栏是否可以滑动
      endDrawerEnableOpenDragGesture: false, // 右侧侧滑栏是否可以滑动
      bottomSheet: Container(
        height: 40,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: Colors.black12))),
        child: Center(
          child: Text('bottomSheet'),
        ),
      ), // 一个持久停留在body下方，底部控件上方的控件
      // backgroundColor: Colors.red.withOpacity(0.1), // 背景色
      resizeToAvoidBottomInset: false, // 防止一些小部件重复
      extendBody: true, // body 是否延伸到底部控件
      drawerEdgeDragWidth: 200, // 侧栏滑动出来的宽度
      // extendBodyBehindAppBar: true, // 默认 false，为 true 时，body 会置顶到 appbar 后，如appbar 为半透明色，可以有毛玻璃效果
      body: Wrap(
        children: [
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/appbarPage')},
              child: Text('appbar')),
          ElevatedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, '/floatingActionButton')},
              child: Text('FloatingActionButton'))
        ],
      ),
    );
  }
}
