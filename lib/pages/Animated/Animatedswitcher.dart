import 'package:flutter/material.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwitcher'),
      ),
      body: Column(
        children: [
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              width: 200,
              height: 300,
              color: Colors.blue,
              child: AnimatedSwitcher(
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                duration: Duration(milliseconds: 1500),
                child: Text(
                  '222',
                  key: UniqueKey(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 100),
                ),
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
