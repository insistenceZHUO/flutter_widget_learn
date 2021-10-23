import 'package:flutter/material.dart';
class GlobalKeyPage extends StatefulWidget {
  const GlobalKeyPage({Key? key}) : super(key: key);

  @override
  _GlobalKeyPageState createState() => _GlobalKeyPageState();
}

final _globalkey = GlobalKey();

class _GlobalKeyPageState extends State<GlobalKeyPage> {
  @override
  Widget build(BuildContext context) {
    /// 获取屏幕的方向;
    print(MediaQuery.of(context).orientation);
    return Scaffold(
      appBar: AppBar(
        title: Text('globalKey'),
      ),

      body: Center(
        child: Column(
          children: [
            Center(child: Box(color: Colors.blue, key: _globalkey, count: 11,)),
            // GestureDetector(
            //   onTap: (){
            //     // (_globalkey.currentWidget as _BoxState)
            //   }
            //     child: Center(child: Box(color: Colors.red, count: 12, key: ValueKey(1),)))
          ],
        ),
      ),
      // body: ,
    );
  }
}

class Box extends StatelessWidget {
   late Color color;
   late int count;
   Box({required this.color,required this.count,  Key? key }) : super(key: key);

   add () {

   }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 100,
        color: color,
        alignment: Alignment.center,
        child: Text(
          '$count',
          style: TextStyle(
            fontSize: 30
          ),
        ),
      ),
    );
  }
}
