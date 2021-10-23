import 'package:flutter/material.dart';
import 'package:widget_details/Tab/Tab.dart' as Menus;
import 'package:widget_details/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',

      // theme: ThemeData(
      //     // primaryColor: Colors.blue,
      //     // scaffoldBackgroundColor: Colors.blue, // 明亮状态下的主题颜色
      //     ),
      darkTheme: ThemeData(primaryColor: Colors.red), // 暗黑状态下的主题颜色
      themeMode: ThemeMode.light, // 主题
      home: Menus.Tab(),
      onGenerateRoute: onGenerateRoute,
      initialRoute: initRoute,
    );
  }
}
