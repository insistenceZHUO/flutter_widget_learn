import 'package:flutter/material.dart';

class FloatingActionButtonPage extends StatefulWidget {
  @override
  _FloatingActionButtonPageState createState() =>
      _FloatingActionButtonPageState();
}

class _FloatingActionButtonPageState extends State<FloatingActionButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButton'),
      ),
      persistentFooterButtons: [Text('111'), Text('111')],
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: Text('点击'),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      //floatingActionButton组件显示位置
      body: ListView(
        children: [
          ListTile(
            title: Text('标题'),
            subtitle: Text('子标题'),
          ),
          Divider(),
          ListTile(
            title: Text('标题'),
            subtitle: Text('子标题'),
          ),
          Divider(),
          ListTile(
            title: Text('标题'),
            subtitle: Text('子标题'),
          ),
          Divider(),
          ListTile(
            title: Text('标题'),
            subtitle: Text('子标题'),
          ),
          Divider(),
          ListTile(
            title: Text('标题'),
            subtitle: Text('子标题'),
          ),
          Divider(),
          ListTile(
            title: Text('标题'),
            subtitle: Text('子标题'),
          ),
          Divider(),
          ListTile(
            title: Text('标题'),
            subtitle: Text('子标题'),
          ),
          Divider(),
          ListTile(
            title: Text('标题'),
            subtitle: Text('子标题'),
          ),
          Divider(),
          ListTile(
            title: Text('标题'),
            subtitle: Text('子标题'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
