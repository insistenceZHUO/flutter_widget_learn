import 'package:flutter/material.dart';

class SliverPersistentHeaderPage extends StatefulWidget {
  @override
  _SliverPersistentHeaderPageState createState() =>
      _SliverPersistentHeaderPageState();
}

class _SliverPersistentHeaderPageState
    extends State<SliverPersistentHeaderPage> {

  final data = [
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
    Colors.purple[50],
    Colors.purple[100],
    Colors.purple[200],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppbar(),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.red,
            ),
          ),
          _buildSliverPersistent(),
          _buildCommonWidget(),
          _buildSliverList()
        ],
      ),
    );
  }

  Widget _buildSliverList() => SliverList(
        delegate: SliverChildBuilderDelegate(
            (_, int index) => Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 60,
                  color: data[index],
                  child: Text(
                    colorString(data[index]),
                    style: TextStyle(color: Colors.white, shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(.5, .5),
                          blurRadius: 2)
                    ]),
                  ),
                ),
            childCount: data.length),
      );

  _buildAppbar() {
    return SliverAppBar(
      expandedHeight: 56,
      leading: _buildLeading(),
      title: Text('zz'),
      actions: [_buildAction()],
      elevation: 5.0,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        titlePadding: EdgeInsets.symmetric(horizontal: 24),
        background: Image.asset(
          'assets/images/caver.webp',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildLeading() => Container(
      margin: EdgeInsets.all(10),
      child: Image.asset('assets/images/icon_head.webp'));

  _buildAction() {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.star_border,
          color: Colors.white,
        ));
  }

  _buildSliverPersistent() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MySliverPersistentHeaderDelegate(),
    );
  }

  String colorString(color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

  Widget _buildCommonWidget() => SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: Colors.grey.withAlpha(22),
          child: ListTile(
            leading: Image.asset("assets/images/icon_head.webp"),
            title: Text("以梦为马"),
            subtitle: Text("海子"),
            selected: true,
            contentPadding: EdgeInsets.all(5),
            trailing: Icon(Icons.more_vert),
          ),
        ),
      );
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text('我是一个SliverPersistentHeader',
            style: TextStyle(color: Colors.white)));
  }

  @override
  double get maxExtent => 200.0; // 最大高度，

  @override
  double get minExtent => 200.0; // 折叠后的高度

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      false; // 如果内容需要更新，设置为true
}
