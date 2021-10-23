import 'package:flutter/material.dart';


class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  _ChangeNotifierPageState createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  UserNotifier _testUserNotifier = UserNotifier(UserInfo(name: "111", age: 0));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _testUserNotifier.addListener(() {
    //   print(6666);
    // });
  }
  @override
  Widget build(BuildContext context) {
    ///页面主体脚手架
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),

      /// 处理滑动
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),

          OutlineButton(
            child: Text("测试用户数据"),
            onPressed: () {
              testUserFunction();
            },
          ),
          SizedBox(
            height: 40,
          ),
          //ValueListenableBuilder是简易版的Provider
          buildUserListenableBuilder(),
        ],
      ),
    );
  }

  ///第二步 定义
  Widget buildUserListenableBuilder() {
    return ValueListenableBuilder(
      ///数据发生变化时回调
      builder: (context, value, child) {
        String message = "--";
        if (value != null) {
          message = "姓名是：${_testUserNotifier.value.name}  年龄是: ${_testUserNotifier.value.age}";
        }
        return Text(message);
      },

      ///监听的数据
      valueListenable: _testUserNotifier,
    );
  }

  void testUserFunction() {
    _testUserNotifier.setName("eeee");
  }
}

class UserInfo {
  String name;
  int age;

  UserInfo({required this.name, required this.age});
}

///自定义 ValueNotifier
/// UserInfo 为数据类型
class UserNotifier extends ValueNotifier<UserInfo> {
  UserNotifier(UserInfo userInfo) : super(userInfo);

  void setName(String name) {
    ///赋值
    value.name = name;
    ///通知更新
    notifyListeners();
  }
}
