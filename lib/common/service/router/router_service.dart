import 'package:flutter/cupertino.dart';

import 'router_factory.dart';

class Router extends NavigatorObserver {
  final GlobalKey appKey = GlobalKey();

  /// 最顶层的context
  BuildContext get appContext => appKey.currentContext!;

  ///
  BuildContext get context => navigator!.context;

  /// 路由表
  Map<String, BaseRoute> routeTable = {};

  /// 当前路由名称
  String? currentRouterName;

  @optionalTypeArgs
  Future<T?> push<T extends Object>(Route<T> route) {
    return navigator!.push(route);
  }

  @optionalTypeArgs
  Future<T?> pushAndRemoveUntil<T extends Object?>(
      Route<T> newRoute, RoutePredicate predicate) {
    return navigator!.pushAndRemoveUntil(newRoute, predicate);
  }

  @optionalTypeArgs
  Future<T?> pushNamed<T extends Object?>(String routeName,
      {Object? arguments}) {
    // 防止重复入栈
    // if (currentRouteName == routeName) {
    //   return null;
    // }
    return navigator!.pushNamed<T?>(routeName, arguments: arguments);
  }

  @optionalTypeArgs
  Future<T?>? pushNamedAndRemoveUntil<T extends Object?>(
      String routeName, RoutePredicate predicate,
      {Object? arguments}) {
    return navigator!
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  @optionalTypeArgs
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
      Route<T> newRoute,
      {TO? result}) {
    return navigator!.pushReplacement(newRoute, result: result);
  }

  @optionalTypeArgs
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
      String routeName,
      {TO? result,
      Object? arguments}) {
    return navigator!
        .pushReplacementNamed(routeName, result: result, arguments: arguments);
  }

  @optionalTypeArgs
  void pop<T extends Object?>([T? result]) {
    navigator!.pop(result);
  }

  @optionalTypeArgs
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
      String routeName,
      {TO? result,
      Object? arguments}) {
    return navigator!
        .popAndPushNamed(routeName, arguments: arguments, result: result);
  }

  void popUntil(RoutePredicate predicate) {
    navigator!.popUntil(predicate);
  }

  void removeRoute(Route<dynamic> route) {
    navigator!.removeRoute(route);
  }

  bool canPop() {
    return navigator!.canPop();
  }

  @optionalTypeArgs
  Future<bool> maybePop<T extends Object?>([T? result]) async {
    return navigator!.maybePop(result);
  }

  Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    List<String> macthKeys = routeTable.keys
        .where((element) => element == routeSettings.name)
        .toList();
    String? matchKey = macthKeys.isNotEmpty ? macthKeys.first : null;
    if (null != matchKey) {
      BaseRoute? baseRoute = routeTable[matchKey];
      if (null != baseRoute) {
        return baseRoute.getRoute(routeSettings);
      }
    }
    return null;
  }
}
