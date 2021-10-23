import 'package:flutter/material.dart';

class ContextPage extends StatefulWidget {
  @override
  _ContextPageState createState() => _ContextPageState();
}

class _ContextPageState extends State<ContextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('context'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      drawer: Drawer(),
      body: Wrap(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('返回')),
          Child()
        ],
      ),
    );
  }
}

class Child extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context) => ElevatedButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            child: Text('点击')));
  }
}
