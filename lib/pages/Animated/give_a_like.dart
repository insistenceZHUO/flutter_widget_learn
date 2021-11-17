import 'package:flutter/material.dart';

class GiveALikePage extends StatefulWidget {
  const GiveALikePage({Key? key}) : super(key: key);

  @override
  _GiveALikePageState createState() => _GiveALikePageState();
}

class _GiveALikePageState extends State<GiveALikePage> {

  bool _isLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _isLike = !_isLike;
          });
        },
        child: Text('click'),
      ),
      appBar: AppBar(
        title: Text('giveALike'),
      ),
      body: Center(
        child: Container(
          child: _isLike ? Icon(Icons.ac_unit, color: Colors.red) : Icon(Icons.ac_unit),
        ),
      ),
    );
  }
}
