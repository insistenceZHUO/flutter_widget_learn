import 'package:shared_preferences/shared_preferences.dart';

/// 缓存管理类
class HiCache {
  // SharedPreferences prefs;
  // HiCache._() {
  //   init();
  // }
  //
  // static HiCache _instance;
  //
  // HiCache._pre(SharedPreferences prefs) {
  //   this.prefs = prefs;
  // }
  //
  // /// 预初始化，防止在使用get时，prefs还未完成初始化
  // static Future<HiCache> preInit() async {
  //   if (_instance == null) {
  //     var prefs = await SharedPreferences.getInstance();
  //     _instance = HiCache._pre(prefs);
  //   }
  //   return _instance;
  // }
  //
  // static HiCache getInstance() {
  //   if (_instance == null) {
  //     _instance = HiCache._();
  //   }
  //   return _instance;
  // }

  // /// 初始化
  // void init() async {
  //   if (prefs == null) {
  //     prefs = await SharedPreferences.getInstance();
  //   }
  // }
}
