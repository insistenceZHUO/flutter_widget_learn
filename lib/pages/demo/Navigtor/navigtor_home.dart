import 'package:flutter/material.dart';

class NavigtorHomePage extends StatefulWidget {
  @override
  _NavigtorHomePageState createState() => _NavigtorHomePageState();
}

class _NavigtorHomePageState extends State<NavigtorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('navigtor_home'),
      ),
      body: Wrap(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/aPage');
              },
              child: Text('跳转到A'))
        ],
      ),
    );
  }
}
