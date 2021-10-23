import 'package:flutter/material.dart';

class LifeCyclePage extends StatefulWidget {
  @override
  _LifeCyclePageState createState() => _LifeCyclePageState();
}

class _LifeCyclePageState extends State<LifeCyclePage> {
  @override
  void initState() {
    super.initState();
    print('initState');

    /// 会在组件渲染完成后调用
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      print('WidgetsBinding');
      // showDialog(context: context,builder: (context){
      //   return AlertDialog(title: Text('AlertDialog'),);
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter 生命周期的理解'),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant LifeCyclePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didupdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
