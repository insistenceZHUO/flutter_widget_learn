import 'package:widget_details/common/service/router/router_factory.dart';
import 'package:widget_details/pages/Home/Scaffold/basic.dart';

class RouterName {
  static const String scaffoldPage = 'scaffoldPage';
}

class RouterTable {
  static Map<String, BaseRoute> table = {
    RouterName.scaffoldPage: BaseRoute(builder: (context, settings) {
      return ScaffoldPage();
    })
  };
}
