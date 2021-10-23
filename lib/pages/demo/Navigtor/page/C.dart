import 'package:flutter/material.dart';

class CPage extends StatefulWidget {
  @override
  _CPageState createState() => _CPageState();
}

class _CPageState extends State<CPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C页面'),
      ),
      body: Center(
          child: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/dPage');
            },
            child: Text('进入D页面'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('pop'),
          ),
        ],
      )),
    );
  }
}
