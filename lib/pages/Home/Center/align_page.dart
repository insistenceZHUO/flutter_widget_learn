import 'package:flutter/material.dart';

class AlignPage extends StatefulWidget {
  const AlignPage({Key? key}) : super(key: key);

  @override
  _AlignPageState createState() => _AlignPageState();
}

class _AlignPageState extends State<AlignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('center'),
      ),

      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 500,
            color: Colors.black,
            child: AnimatedAlign(
              alignment: Alignment.topRight,
              duration: Duration(milliseconds: 1000),
              child: TextButton(
                onPressed: () {},
                child: Text('点击'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
