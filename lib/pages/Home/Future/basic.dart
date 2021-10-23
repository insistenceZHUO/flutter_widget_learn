import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              /// Future
              ElevatedButton(
                  onPressed: () {
                    Future(() async {
                      var result = await 4;
                      return result;
                    })
                        .then((value) => print(value))
                        .whenComplete(() => print('执行了2'));
                  },
                  child: Text('Future')),

              /// Duretion
              ElevatedButton(
                  onPressed: () {
                    Duration(seconds: 3);
                  },
                  child: Text('Duretion')),

              /// Future.delayed
              ElevatedButton(
                  onPressed: () async {
                    await Future.delayed(Duration(seconds: 3), () {
                      print('我执行了');
                    });
                  },
                  child: Text('Future.delayed')),

              /// Future.sync();
              ElevatedButton(
                  onPressed: () {
                    Future.sync(() => print('同步运行的Future'))
                        .whenComplete(() => print('complete'));
                  },
                  child: Text('Future.sync')),

              /// Future.value
              ElevatedButton(
                  onPressed: () {
                    Future.value(2).then((value) => print(value));
                  },
                  child: Text('Future.value')),

              /// Future.await等待多个任务完成后的回调函数
              ElevatedButton(
                  onPressed: () {
                    Future.wait([Future.value(1), Future.value(2)])
                        .then((value) {
                      print(value);
                    }).catchError((e) {
                      print('出错了');
                    });
                  },
                  child: Text('Future.await')),
            ],
          )
        ],
      ),
    );
  }
}
