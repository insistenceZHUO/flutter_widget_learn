import 'package:flutter/material.dart';

class DemoTab extends StatefulWidget {
  @override
  _DemoTabState createState() => _DemoTabState();
}

class _DemoTabState extends State<DemoTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DemoTab'),
      ),
      body: Wrap(
        children: [
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/mnmonice')},
              child: Text('mnmonice')),
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/context')},
              child: Text('context')),
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/lifecycle')},
              child: Text('lifecycle')),
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/navigtorHome')},
              child: Text('pageHome')),
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/providerPage')},
              child: Text('provider')),
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/globalKey')},
              child: Text('globalKey')),
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/changeNotifier')},
              child: Text('ChangeNotifier')),
        ],
      ),
    );
  }
}
