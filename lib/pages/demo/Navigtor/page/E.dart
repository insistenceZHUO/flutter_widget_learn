import 'package:flutter/material.dart';

class EPage extends StatefulWidget {
  late final String details;
  EPage({Key? key, required String this.details}) : super();
  @override
  _EPageState createState() => _EPageState();
}

class _EPageState extends State<EPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.details),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop<String>('我是返回的参数');
                    },
                    child: Text('返回并传递参数'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
