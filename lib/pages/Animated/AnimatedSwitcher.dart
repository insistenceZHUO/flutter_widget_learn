import 'package:flutter/material.dart';
import 'package:widget_details/common/widget/annotation_widget.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  bool _switcher = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('点击'),
        onPressed: () {
          setState(() {
            _switcher = !_switcher;
          });
        },
      ),
      appBar: AppBar(
        title: Text('AnimatedSwitcher'),
      ),
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 16),
        child: ListView(
          children: [
            AnnotationWidget(
                text:
                'AnimatedSwitcher的transitionBuilder属性, 默认为FadeTranstion属性;'),
            buildAnimatedSwitcher(),
            AnnotationWidget(text: 'rotationTransition属性'),
            buildRotationTransition(),
            AnnotationWidget(text: 'scaleTransition属性'),
            BuildScaleTransition(),
          ],
        ),
      ),
    );
  }

  Widget BuildScaleTransition() {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return FadeTransition(
                opacity: animation,
                child: ScaleTransition(scale: animation, child: child,));
          },
          child:_switcher? Text(
              '变小了',
            key: UniqueKey(),
          ):Text(
            '变大了',
            key: UniqueKey(),
          ),
        ),
      ),
    );
  }

  Widget buildRotationTransition() {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
        child: AnimatedSwitcher(
          transitionBuilder: (child, animation) {
            return RotationTransition(
              turns: animation,
              child: child,
            );
          },
          duration: Duration(milliseconds: 500),
          child: Text(
            'rotationTranswsition',
            key: UniqueKey(),
          ),
        ),
      ),
    );
  }

  Widget buildAnimatedSwitcher() {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: 200,
        height: 200,
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
          duration: Duration(milliseconds: 500),
          child: _switcher
              ? Text(
            'AnimatedSwitcher1111',
            key: UniqueKey(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          )
              : Text(
            'AnimatedSwitcher2222',
            key: UniqueKey(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
