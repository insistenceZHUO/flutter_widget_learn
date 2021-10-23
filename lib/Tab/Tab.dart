import 'package:flutter/material.dart';
import 'package:widget_details/Tab/Home.dart';
import 'package:widget_details/Tab/Settings.dart';

import 'Demo.dart';

class Tab extends StatefulWidget {
  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<Tab> {
  final List<Map<String, dynamic>> _pageList = [
    {'name': 'home页面', 'widget': HomeTab()},
    {'name': 'setting页面', 'widget': DemoTab()},
    {'name': 'setting页面', 'widget': SettingTab()}
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentIndex]['widget'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.deck), label: '演示'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
        ],
      ),
    );
  }
}
