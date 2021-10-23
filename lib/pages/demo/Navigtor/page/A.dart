import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_details/pages/demo/Navigtor/navigtor_home.dart';

import 'B.dart';
import 'E.dart';

class APage extends StatefulWidget {
  @override
  _APageState createState() => _APageState();
}

class _APageState extends State<APage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A页面'),
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return BPage();
                }));
              },
              child: Text('push-> 进入B页面'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bPage');
              },
              child: Text('pushNamed -> 进入B页面'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) {
                    return BPage();
                  }));
                },
                child: Text('pushReplacement -> 进入B页面')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/bPage');
                },
                child: Text('pushReplacementNamed -> 进入B页面')),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).popAndPushNamed('/bPage');
                }
              },
              child: Text('popAndPushNamed'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (Navigator.canPop(context)) {
                  String str =
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EPage(
                                details: '11',
                              )));
                  print('子widget返回的参数$str');
                }
              },
              child: Text('向e组件传递参数 '),
            ),
          ],
        ),
      ),
    );
  }
}
