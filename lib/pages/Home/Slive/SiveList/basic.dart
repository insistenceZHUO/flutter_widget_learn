import 'package:flutter/material.dart';

class SliveListPage extends StatefulWidget {
  @override
  _SliveListPageState createState() => _SliveListPageState();
}

class _SliveListPageState extends State<SliveListPage> {
  final List colorData = [
    Colors.purple[50],
    Colors.purple[100],
    Colors.purple[200],
    Colors.purple[300],
    Colors.purple[400],
    Colors.purple[500],
    Colors.purple[600],
    Colors.purple[700],
    Colors.purple[800],
    Colors.purple[900],
    Colors.blue[900],
    // Colors.purple[1000],
  ];

  _buildSliverAppbar(context) {
    return SliverAppBar(
      expandedHeight: 190,
      leading: _buildLeading(),
      title: Text('zz'),
      actions: _buildAction(),
      pinned: true,
      backgroundColor: Colors.orange,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 55, bottom: 15),
        collapseMode: CollapseMode.parallax,
        stretchModes: [StretchMode.zoomBackground, StretchMode.blurBackground],
        background: Image.asset(
          'assets/images/caver.webp',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('SliveList'),
        // ),
        body: CustomScrollView(
      slivers: [
        _buildSliverAppbar(context),
        _buildSliveList(),
      ],
    ));
  }

  _buildLeading() => Container(
        margin: EdgeInsets.all(10),
        child: Image.asset('assets/images/icon_head.webp'),
      );

  _buildSliveList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((content, index) {
        return Container(
          height: 65,
          color: colorData[index],
        );
      }, childCount: colorData.length),
    );
  }

  _buildAction() {
    return [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.star_border,
          color: Colors.white,
          // size: 100,
        ),
      )
    ];
  }
}
