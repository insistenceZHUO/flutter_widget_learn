import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_details/pages/Animated/AnimatedSwitcher.dart';
import 'package:widget_details/pages/Animated/TweenAnimationBuilder.dart';
import 'package:widget_details/pages/Animated/basic.dart';
import 'package:widget_details/pages/Home/AlertDialog/basic.dart';
import 'package:widget_details/pages/Home/BuildContext/basic.dart';
import 'package:widget_details/pages/Home/Canvas/basic.dart';
import 'package:widget_details/pages/Home/Center/align_page.dart';
import 'package:widget_details/pages/Home/Constraint/basic.dart';
import 'package:widget_details/pages/Home/Future/basic.dart';
import 'package:widget_details/pages/Home/LifeCycle/basic.dart';
import 'package:widget_details/pages/Home/PageView/basic.dart';
import 'package:widget_details/pages/Home/Scaffold/basic.dart';
import 'package:widget_details/pages/Home/Scaffold/page/Appbar/basic.dart';
import 'package:widget_details/pages/Home/Scaffold/page/FloatingActionButton/basic.dart';
import 'package:widget_details/pages/Home/Slive/SiveList/basic.dart';
import 'package:widget_details/pages/Home/Slive/SliverAppBar/basic.dart';
import 'package:widget_details/pages/Home/Slive/SliverFillRemaining/basic.dart';
import 'package:widget_details/pages/Home/Slive/SliverPersistentHeader/basic.dart';
import 'package:widget_details/pages/Home/Slive/basic.dart';
import 'package:widget_details/pages/Home/Stack/basic.dart';
import 'package:widget_details/pages/Home/TextField/basic.dart';
import 'package:widget_details/pages/Home/flow/basic.dart';
import 'package:widget_details/pages/demo/ChangeNotifier/basic.dart';
import 'package:widget_details/pages/demo/Context/basic.dart';
import 'package:widget_details/pages/demo/Key/glabolKey.dart';
import 'package:widget_details/pages/demo/Lifecycle/basic.dart';
import 'package:widget_details/pages/demo/Mnmonice/basic.dart';
import 'package:widget_details/pages/demo/Navigtor/navigtor_home.dart';
import 'package:widget_details/pages/demo/Navigtor/page/A.dart';
import 'package:widget_details/pages/demo/Navigtor/page/B.dart';
import 'package:widget_details/pages/demo/Navigtor/page/C.dart';
import 'package:widget_details/pages/demo/Navigtor/page/D.dart';
import 'package:widget_details/pages/demo/Navigtor/page/E.dart';
import 'package:widget_details/pages/demo/provider/basic.dart';
import 'package:widget_details/pages/demo/util/basic.dart';
import 'package:widget_details/pages/demo/stream/basic.dart';

final routes = {
  '/scaffoldPage': (context) => ScaffoldPage(),
  '/appbarPage': (context) => AppbarPage(),
  '/floatingActionButton': (context) => FloatingActionButtonPage(),
  '/textField': (context) => TextFieldPage(),
  '/alertDialog': (context) => AlertDialogPage(),
  '/mnmonice': (context, {arguments}) => MnmonicePage(
        key: arguments,
      ),
  '/context': (context) => ContextPage(),
  '/lifecycle': (context) => LifecyclePage(),
  '/animated': (context) => AnimatedPage(),
  '/animatedSwitcher': (context) => AnimatedSwitcherPage(),
  '/tweenAnimationbuilder': (context) => TweenAnimationBuilderPage(),
  '/navigtorHome': (context) => NavigtorHomePage(),
  '/aPage': (context) => APage(),
  '/bPage': (context) => BPage(),
  '/cPage': (context) => CPage(),
  '/dPage': (context) => DPage(),
  '/future': (context) => FuturePage(),
  '/providerPage': (context) => ProviderPage(),
  '/slive': (context) => SlivePage(),
  '/sliveList': (context) => SliveListPage(),
  '/sliverPersistentHeader': (context) => SliverPersistentHeaderPage(),
  '/sliverAppbar': (context) => SliverAppbarPage(),
  '/sliverFillRemaining': (context) => SliverFillRemainingPage(),
  '/buildContext': (context) => BuildContextPage(),
  '/lifeCycle': (context) => LifeCyclePage(),
  '/constraint': (context) => ConstraintPage(),
  '/stack': (context) => StackPage(),
  '/globalKey': (context) => GlobalKeyPage(),
  '/canvas': (context) => CanvasPage(),
  '/changeNotifier':(context) =>ChangeNotifierPage(),
  '/testDebounce':(context) =>TestDebouncePage(),
  '/centerPage':(context) =>AlignPage(),
  '/pageViewPage':(context) =>PageViewPage(),
  '/flow':(context) =>FlowBasicPage(),
  '/streamPage':(context) =>StreamPage(),
};

final initRoute = '/';

final onGenerateRoute = (RouteSettings settings) {
  print('settings:${settings}');
  // 统一处理;
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
