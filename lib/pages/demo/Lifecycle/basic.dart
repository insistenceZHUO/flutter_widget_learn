import 'package:flutter/material.dart';

class LifecyclePage extends StatefulWidget {
  final title;

  LifecyclePage({this.title});

  @override
  _LifecyclePageState createState() => _LifecyclePageState();
}

class _LifecyclePageState extends State<LifecyclePage> with WidgetsBindingObserver {
  /// 页面将要与widget绑定的时候，调用inintstate，
  /// initstate只会调用一次。在生命周期函数中，你无法获取buildContext,
  ///     Future.delayed(Duration(microseconds: 0), () {
  ///       print(context.size);
  ///     });
  ///  订阅通知，初始化操作，加载网络请求。

  @override
  void initState() {
    print('组件初始化1');
    print(widget.title);
    super.initState();

    WidgetsBinding.instance!.addObserver(this);
    /// 当前框架绘制完成之后调用
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         title: Text('AlertDialog'),
      //       );
      //     });
    });

    print('组件初始化2');
    Future.delayed(Duration(microseconds: 0), () {
      print(context.size);
    });
  }

  /// 在initState之后调用
  ///
  /// 当state对象依赖关系发生变化的时，该方法被调用。初始化的时候也会被调用。
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.dependOnInheritedWidgetOfExactType<IconTheme>();
  }

  @override
  void didUpdateWidget(covariant Widget oldWidget) {
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    print('组件销毁1');
    super.dispose();
    print('组件销毁2');
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("didChangeAppLifecycleState: $state");
    if (state == AppLifecycleState.paused) {
      print('AppLifecycleState.paused:${AppLifecycleState.paused}');
    }

    if (state == AppLifecycleState.resumed) {
      print('AppLifecycleState.resumed:${AppLifecycleState.resumed}');
    }

    if (state == AppLifecycleState.inactive) {
      print('AppLifecycleState.inactive:${AppLifecycleState.inactive}');
    }

    if (state == AppLifecycleState.detached) {
      print('AppLifecycleState.inactive:${AppLifecycleState.detached}');
    }
  }

  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('lifecycle'),
      ),
      body: Column(
        children: [
          Visibility(
            visible: isShow,
            child: Child(),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isShow = !isShow;
                });
              },
              child: Text('点击1'))
        ],
      ),
    );
  }
}

class Child extends StatefulWidget {
  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('2222'),
    );
  }
}


class A extends StatelessWidget {
  const A({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
