import 'dart:async';

import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {

  final stream = Stream.periodic(Duration(seconds:1), (e) => 42);
  final controller = StreamController();
  @override
  void initState() {
    // stream.listen((event) {
    //   print('event:${event}');
    // });
    super.initState();
    controller.sink.add(1);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream'),
      ),
      body: DefaultTextStyle(
        style: TextStyle(
          fontSize: 16
        ),
        child: Center(
          child: StreamBuilder<Object>(
            stream: stream,
            builder: (context, snapshot) {
              switch(snapshot.connectionState){
                /// stream为null的时候, state为null;
                case ConnectionState.none:
                  // TODO: Handle this case.
                return Text('没有数据流');
                  break;
                case ConnectionState.waiting:
                  // TODO: Handle this case.
                return Text('wanning:等待数据流');
                  break;
                case ConnectionState.active:
                  // TODO: Handle this case.
                if (snapshot.hasError) {
                  return Text('active:错误: ${snapshot.error}');
                } else {
                  return Text('active:正常: ${snapshot.data}');
                }
                  break;
                case ConnectionState.done:
                  // TODO: Handle this case.
                return Text('数据流已经关闭了');
                  break;
              }
            }
          ),
        ),
      ),
    );
  }
}
