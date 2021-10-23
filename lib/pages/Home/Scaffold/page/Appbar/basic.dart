import 'package:flutter/material.dart';

class AppbarPage extends StatefulWidget {
  @override
  _AppbarPageState createState() => _AppbarPageState();
}

class _AppbarPageState extends State<AppbarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => {print(6666)},
        ), // 左侧图标配置,在标题前面显示的一个控件，在首页通常显示应用的 logo或菜单；在其他界面通常显示为返回按钮
        automaticallyImplyLeading:
            true, //默认true leading为null，并且堆栈中存在页面，则自动推导为BackButton。leading不为null，则此参数无效为false时不会推导，使中间/标题拉伸
        //  右侧图标配置
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => {print(6666)},
          )
        ],
        // flexibleSpace: SizedBox(
        //   width: 50,
        //   child: Text('qqq'),
        // ), // 可伸展、折叠部件
        // bottom: , // 通常放 tabBar，标题下面显示一个 Tab 导航栏
        elevation: 5, // 导航栏下面的投影
        // shape: BeveledRectangleBorder(
        //     side: BorderSide(width: 1, color: Colors.red),
        //     borderRadius: BorderRadius.circular(10)), // 形状
        backgroundColor: Colors.red, // 导航背景颜色
        // foregroundColor：Colors.blue,
        brightness: Brightness.dark, // 亮度
        // iconTheme: IconThemeData(color: Color(0xff333333)), // 图标样式
        // actionsIconTheme:IconThemeData(color: Color(0xff333333)), // actions样式
        // textTheme:IconThemeData(color: Color(0xff333333)), //  文字样式
        titleSpacing: 24, // title标题距离左边的距离
        leadingWidth: 0, // leadingWidth 定义左边部分的宽度
        // toolbarHeight: 20, // 设置导航栏的高度
        // toolbarOpacity: 0.5, // 应用工具栏透明度
        // bottomOpacity：0.5, // 应用栏底部透明度
        title: Text('喜欢112222'),
        centerTitle: true, // 标题是否居中
        primary: true, // toolbar是否显示在应用栏顶部
        // shadowColor： Color(0xff333333), // 下方阴影
        // leadingWidth: 32,
      ),
    );
  }
}
