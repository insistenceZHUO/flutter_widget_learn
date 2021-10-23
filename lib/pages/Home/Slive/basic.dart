import 'package:flutter/material.dart';

class SlivePage extends StatefulWidget {
  @override
  _SlivePageState createState() => _SlivePageState();
}

class _SlivePageState extends State<SlivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slive'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/sliveList');
              },
              child: Text('SliveList')),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/sliverPersistentHeader');
            },
            child: Text('SliverPersistentHeader'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/sliverAppbar');
            },
            child: Text('sliverAppbar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/sliverFillRemaining');
            },
            child: Text('SliverFillRemaining'),
          ),
        ],
      ),
    );
  }
}
