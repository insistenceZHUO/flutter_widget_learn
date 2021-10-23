import 'package:flutter/services.dart';

class PolePlugin {
  static const MethodChannel _methodChannel =
      const MethodChannel("PoleInteractionPlugin");

  /// 获取手机代理
  static Future<dynamic> getSystemProxy() async {
    return await _methodChannel.invokeMethod("getSystemProxy");
  }
}
