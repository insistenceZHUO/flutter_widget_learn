import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  _showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 设置点击遮罩层是否关闭，
      barrierColor: Color(0xffa1afc9), // 遮罩层颜色
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            'title',
            textAlign: TextAlign.center,
          ), // title
          content: Text(
            'dialogB11ody1111',
          ), // 中间内容区域
          // backgroundColor: Color(0xff990099).withOpacity(0.8), // 背景颜色
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)), // 设置alertDialog对话框的的形状
          elevation: 0,
          actionsOverflowDirection: VerticalDirection.down,
          actionsOverflowButtonSpacing: 2.0,
          titlePadding: EdgeInsets.only(
              left: 50, right: 50, top: 0, bottom: 0), // title内边距
          contentPadding:
              EdgeInsets.only(left: 50, right: 50), // 中间内容区域的padding
          // buttonPadding:
          //     EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0), // 按钮内边距
          actionsPadding: EdgeInsets.only(right: 30),
          actions: <Widget>[
            ElevatedButton(
              child: Text('buttonText1'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
              // style: ,
            ),
          ], // alertDialog底部一组widget
        );
      },
    );
  }

  _showGeneralDialog() {
    // return showGeneralDialog(context: context, pageBuilder: pageBuilder)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('alertDialog'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                _showMyDialog();
              },
              child: Text(' show dialog')),
        ],
      ),
    );
  }
}

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

