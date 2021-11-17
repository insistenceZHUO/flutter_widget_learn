import 'dart:async';

import 'package:flutter/material.dart';

class SteamBuilderPage extends StatefulWidget {
  const SteamBuilderPage({Key? key}) : super(key: key);

  @override
  _SteamBuilderPageState createState() => _SteamBuilderPageState();
}

class _SteamBuilderPageState extends State<SteamBuilderPage> {
  final stream = Stream.periodic(Duration(milliseconds: 1000), (_) => 42);

  /// 创建数据流;
  final _controller = StreamController();

  @override
  void initState() {
    super.initState();
    // stream.listen((event) {
    //   print("event:${event}");
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stream'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                _controller.sink.add(12);
              },
              child: Text('click'),
            ),
            StreamBuilder(
                stream: _controller.stream,
                builder: (context, snapshot) {
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                      return Text('stream为null');
                      break;
                    case ConnectionState.waiting:
                      return Text('等待数据流');
                      break;
                    case ConnectionState.active:
                      if(snapshot.hasError){
                        return Text('Active: ${snapshot.hasError}');
                        break;
                      } else {
                        return Text('Active: ${snapshot.hasData}');
                        break;
                      }
                    case ConnectionState.done:
                      return Text('streambuilder关闭了');
                      break;
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
