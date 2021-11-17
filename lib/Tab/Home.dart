import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Wrap(
        runSpacing: 2,
        spacing: 4,
        children: [
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/scaffoldPage')},
              child: Text('scaffold')),
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/textField')},
              child: Text('TextField')),
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/alertDialog')},
              child: Text('AlertDialog')),
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/animated')},
              child: Text('Animated')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/future');
              },
              child: Text('Future')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/slive');
              },
              child: Text('Slive')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/buildContext');
              },
              child: Text('context理解')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/lifeCycle');
              },
              child: Text('flutter 生命周期理解')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/constraint');
              },
              child: Text('flutter 盒子约束理解')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stack');
              },
              child: Text('stack')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/canvas');
              },
              child: Text('Canvas')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/testDebounce');
              },
              child: Text('防抖与节流')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/centerPage');
              },
              child: Text('center')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pageViewPage');
              },
              child: Text('PageView')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/flow');
              },
              child: Text('flow')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/steamBuilder');
              },
              child: Text('SteamBuilder')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/printBasic');
              },
              child: Text('Paint')),
        ],
      ),
    );
  }
}
