import 'package:flutter/material.dart';

class SliverFillRemainingPage extends StatefulWidget {
  @override
  _SliverFillRemainingPageState createState() =>
      _SliverFillRemainingPageState();
}

class _SliverFillRemainingPageState extends State<SliverFillRemainingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: 300,
              floating: true, // 设置为ture时，appbar跟随手势一起滑动；
              snap: true, // 值为ture时；手势滑动一点点时，也会全部展开或者全部收起;
              pinned: true, // 值为true时，滑动的时候会有一个最小高度在最顶部；
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                // title: Text('善良的小猪'),
                background: FlutterLogo(),
              ),
              title: Text('这是一个appbar组件')),
          SliverFillRemaining(
            child: Container(
              alignment: Alignment.center,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
