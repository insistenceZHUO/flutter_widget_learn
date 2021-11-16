import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  double _height = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('animated'),
        ),
        body: Column(
          children: [
            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                width: 200,
                height: _height,
                color: Colors.blue,
                // curve: ,
                child: Text('11'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _height = _height < 500 ? _height += 200 : 200;
                  });
                },
                child: Text('点击')),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/animatedSwitcher');
                    },
                    child: Text('AnimatedSwitcher')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/tweenAnimationbuilder');
                    },
                    child: Text('tweenAnimationBuilder'))
              ],
            )
          ],
        ));
  }
}
