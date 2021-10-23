import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum RouterType {
  scale, // 缩放路由动画
  fade, // 渐变透明路由动画
  rotate, // 旋转路由动画
  r2l, // 右--->左
  l2r, // 左--->右
  t2b, // 上--->下
  b2t, // 下--->上
  scale_fade_rotate, // 缩放+透明+旋转路由动画
  no_animate, // 无动画
}

typedef Widget RouterBuilder(BuildContext context, RouteSettings settings);

class BaseRoute<T> {
  BaseRoute({
    required this.builder,
    this.routerType = RouterType.r2l,
  });

  final RouterBuilder builder;
  final RouterType? routerType;

  Route<T>? getRoute(RouteSettings settings) {
    switch (this.routerType!) {
      case RouterType.scale:
        return ScaleRouter<T>(
          page: (context) => this.builder(context, settings),
          settings: settings,
        );
      case RouterType.fade:
        return FadeRouter<T>(
          page: (context) => this.builder(context, settings),
          settings: settings,
        );
      case RouterType.rotate:
        return RotateRouter<T>(
          page: (context) => this.builder(context, settings),
          settings: settings,
        );
      case RouterType.r2l:
        return CupertinoPageRoute<T>(
            builder: (ctx) => this.builder(ctx, settings),
            settings: settings); // 侧滑返回效果
      // return Right2LeftRouter<T>(page:(context) => this.builder(context, settings), settings: settings,);
      case RouterType.l2r:
        return Left2RightRouter<T>(
          page: (context) => this.builder(context, settings),
          settings: settings,
        );
      case RouterType.t2b:
        return Top2BottomRouter<T>(
          page: (context) => this.builder(context, settings),
          settings: settings,
        );
      case RouterType.b2t:
        return Bottom2TopRouter<T>(
          page: (context) => this.builder(context, settings),
          settings: settings,
        );
      case RouterType.scale_fade_rotate:
        return ScaleFadeRotateRouter<T>(
          page: (context) => this.builder(context, settings),
          settings: settings,
        );
      case RouterType.no_animate:
        return NoAnimRouter<T>(
          page: (context) => this.builder(context, settings),
          settings: settings,
        );
    }
  }
}

/// 缩放路由动画
class ScaleRouter<T> extends PageRouteBuilder<T> {
  final WidgetBuilder page;
  final int durationMs;
  final Curve curve;
  final RouteSettings settings;

  ScaleRouter(
      {required this.page,
      required this.settings,
      this.durationMs = 300,
      this.curve = Curves.fastOutSlowIn})
      : super(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              page(context),
          transitionDuration: Duration(milliseconds: durationMs),
          transitionsBuilder: (context, a1, a2, child) => ScaleTransition(
            scale: Tween(begin: 0.0, end: 1.0)
                .animate(CurvedAnimation(parent: a1, curve: curve)),
            child: child,
          ),
        );
}

/// 渐变透明路由动画
class FadeRouter<T> extends PageRouteBuilder<T> {
  final WidgetBuilder page;
  final int durationMs;
  final Curve curve;
  final RouteSettings settings;

  FadeRouter(
      {required this.page,
      required this.settings,
      this.durationMs = 300,
      this.curve = Curves.fastOutSlowIn})
      : super(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                page(context),
            transitionDuration: Duration(milliseconds: durationMs),
            transitionsBuilder: (context, a1, a2, child) => FadeTransition(
                  opacity: Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
                    parent: a1,
                    curve: curve,
                  )),
                  child: child,
                ));
}

/// 旋转路由动画
class RotateRouter<T> extends PageRouteBuilder<T> {
  final WidgetBuilder page;
  final int durationMs;
  final Curve curve;
  final RouteSettings settings;

  RotateRouter(
      {required this.page,
      required this.settings,
      this.durationMs = 300,
      this.curve = Curves.fastOutSlowIn})
      : super(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                page(context),
            transitionDuration: Duration(milliseconds: durationMs),
            transitionsBuilder: (context, a1, a2, child) => RotationTransition(
                  turns: Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
                    parent: a1,
                    curve: curve,
                  )),
                  child: child,
                ));
}

/// 右--->左
class Right2LeftRouter<T> extends PageRouteBuilder<T> {
  final WidgetBuilder page;
  final int durationMs;
  final Curve curve;
  final RouteSettings settings;

  Right2LeftRouter(
      {required this.page,
      required this.settings,
      this.durationMs = 300,
      this.curve = Curves.fastOutSlowIn})
      : super(
            settings: settings,
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (ctx, a1, a2) => page(ctx),
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              child,
            ) =>
                SlideTransition(
                  child: child,
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                ));
}

/// 左--->右
class Left2RightRouter<T> extends PageRouteBuilder<T> {
  final WidgetBuilder page;
  final int durationMs;
  final Curve curve;
  final RouteSettings settings;

  Left2RightRouter(
      {required this.page,
      required this.settings,
      this.durationMs = 300,
      this.curve = Curves.fastOutSlowIn})
      : super(
            settings: settings,
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (ctx, a1, a2) {
              return page(ctx);
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

/// 上--->下
class Top2BottomRouter<T> extends PageRouteBuilder<T> {
  final WidgetBuilder page;
  final int durationMs;
  final Curve curve;
  final RouteSettings settings;

  Top2BottomRouter(
      {required this.page,
      required this.settings,
      this.durationMs = 300,
      this.curve = Curves.fastOutSlowIn})
      : super(
            settings: settings,
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (ctx, a1, a2) {
              return page(ctx);
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, -1.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

/// 下--->上
class Bottom2TopRouter<T> extends PageRouteBuilder<T> {
  final WidgetBuilder page;
  final int durationMs;
  final Curve curve;
  final RouteSettings settings;

  Bottom2TopRouter(
      {required this.page,
      required this.settings,
      this.durationMs = 300,
      this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (ctx, a1, a2) => page(ctx),
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, 1.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

/// 缩放+透明+旋转路由动画
class ScaleFadeRotateRouter<T> extends PageRouteBuilder<T> {
  final WidgetBuilder page;
  final int durationMs;
  final Curve curve;
  final RouteSettings settings;

  ScaleFadeRotateRouter(
      {required this.page,
      required this.settings,
      this.durationMs = 1000,
      this.curve = Curves.fastOutSlowIn})
      : super(
            settings: settings,
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (ctx, a1, a2) => page(ctx), //页面
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) =>
                RotationTransition(
                  //旋转动画
                  turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: a1,
                    curve: curve,
                  )),
                  child: ScaleTransition(
                    //缩放动画
                    scale: Tween(begin: 0.0, end: 1.0)
                        .animate(CurvedAnimation(parent: a1, curve: curve)),
                    child: FadeTransition(
                      opacity: //透明度动画
                          Tween(begin: 0.5, end: 1.0).animate(
                              CurvedAnimation(parent: a1, curve: curve)),
                      child: child,
                    ),
                  ),
                ));
}

/// 无动画
class NoAnimRouter<T> extends PageRouteBuilder<T> {
  final WidgetBuilder page;
  final RouteSettings settings;

  NoAnimRouter({required this.page, required this.settings})
      : super(
            settings: settings,
            opaque: false,
            pageBuilder: (context, animation, secondaryAnimation) =>
                page(context),
            transitionDuration: Duration(milliseconds: 0),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);
}
