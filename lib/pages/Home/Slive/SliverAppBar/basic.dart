import 'package:flutter/material.dart';

class SliverAppbarPage extends StatefulWidget {
  @override
  _SliverAppbarPageState createState() => _SliverAppbarPageState();
}

class _SliverAppbarPageState extends State<SliverAppbarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              // expandedHeight: 300,
              floating: true, // 设置为ture时，appbar跟随手势一起滑动；
              snap: true, // 值为ture时；手势滑动一点点时，也会全部展开或者全部收起;
              pinned: false, // 值为true时，滑动的时候会有一个最小高度在最顶部；
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                // title: Text('善良的小猪'),
                background: FlutterLogo(),
              ),
              title: Text('这是一个appbar组件')
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                      padding: EdgeInsets.all(15),
                      child: Text('$index'),
                    ),
                childCount: 50),
          ),
          // SliverFixedExtentList(delegate: delegate, itemExtent: itemExtent)
        ],
      ),
    );
  }
}
