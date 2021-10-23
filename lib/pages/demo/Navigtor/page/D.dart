import 'package:flutter/material.dart';

class DPage extends StatefulWidget {
  int a = 12;

  @override
  _DPageState createState() => _DPageState();
}

class _DPageState extends State<DPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('D页面'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.popUntil(context, ModalRoute.withName('/cPage'));
                }
              },
              child: Text('popUntil'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushReplacement(context, newRoute)
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //     '/aPage', ModalRoute.withName('/cPage'));
                Navigator.pop(context);
              },
              child: Text('back'),
            ),
          ],
        ),
      ),
    );
  }
}
