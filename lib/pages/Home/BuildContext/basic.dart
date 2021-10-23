import 'package:flutter/material.dart';

class BuildContextPage extends StatefulWidget {
  @override
  _BuildContextPageState createState() => _BuildContextPageState();
}

class _BuildContextPageState extends State<BuildContextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('buildContext'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                print(Theme.of(context).backgroundColor);
              },
              child: Text('点击'))
        ],
      ),
    );
  }
}
