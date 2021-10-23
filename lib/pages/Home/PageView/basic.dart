import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView'),
      ),
      body: Container(
        height: 400,
        child: PageView(
          controller: PageController(
              viewportFraction:0.8
          ),
          // pageSnapping:true,
          // padEnds:true,
          children: [
            Container(
              // padding: EdgeInsets.only(left: 24),
              child: Text('dasdadadadasdadadasdadadadasdadada'),
              color: Colors.red,
            ),
            Container(
              // padding: EdgeInsets.only(left: 24),
              child: Text('dasdadadadasdadadasdadadadasdadada'),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
