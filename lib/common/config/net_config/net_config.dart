import 'package:widget_details/common/config/i_config.dart';
// import 'package:widget_details/common/service/slope_service.dart';
import 'package:wd_common_package/wd_common_package.dart';

import '../i_config.dart';

class FlavorSymbol {
  static const String app = "app";
  static const String appDev = "appDev";
  static const String appTest = "appTest";

  const FlavorSymbol.internal();
}

const Map<String, String> flavorMap = {
  FlavorSymbol.app: "正式环境",
  FlavorSymbol.appDev: "开发环境",
  FlavorSymbol.appTest: "测试环境",
};

/// 默认服务环境为appDev
const String _defaultFlavor = FlavorSymbol.appDev;

/// 打包时的环境
const String kBuildDefaultFlavor =
    String.fromEnvironment("flavor", defaultValue: _defaultFlavor);

/// 是否是正式上线环境
final bool kIsPublicVersion = FlavorSymbol.app == kBuildDefaultFlavor;

/// 是否是开发环境
final bool kIsDevVersion = FlavorSymbol.appDev == kBuildDefaultFlavor;

/// 网络配置
class NetConfig extends IConfig {
  /// 接口服务
  String get baseUrl => apiHostMap[flavor]!;

  /// 文件服务
  String get fileBaseUrl => fileApiHostMap[flavor]!;

  /// webSocket推送服务
  String get webSocketUrl => webSocketMap[flavor]!;

  static const String _kFlavorSymbolKey = "_kSlopeFlavorSymbolKey";

  /// 服务环境：
  /// * [app] :正式环境
  /// * [appDev] :开发环境
  /// * [appTest] :测试环境
  String? _flavor;

  /// 当前服务器环境
  String get flavor {
    if (null == _flavor) {
      // _flavor = service.cache.getString(_kFlavorSymbolKey, defaultValue: kBuildDefaultFlavor);
    }
    return _flavor!;
  }

  /// 环境切换
  /// value: app/appDev/appTest
  set flavor(String value) {
    assert(value == FlavorSymbol.app ||
        value == FlavorSymbol.appTest ||
        value == FlavorSymbol.appDev);
    _flavor = value;
    // service.cache.setString(_kFlavorSymbolKey, value);
    logger.d("flavor switch to $value${flavorMap[value]}");
  }

  final Map<String, String> apiHostMap = {
    FlavorSymbol.app: "https://dex-api.slope.finance",
    FlavorSymbol.appDev: "http://192.168.0.106:8005",
    FlavorSymbol.appTest: "http://47.115.31.125:8005",
  };

  final Map<String, String> fileApiHostMap = {
    FlavorSymbol.app: "http://47.115.31.125:8081",
    FlavorSymbol.appDev: "http://47.115.31.125:8081",
    FlavorSymbol.appTest: "http://47.115.31.125:8081",
  };

  final Map<String, String> webSocketMap = {
    FlavorSymbol.app: "ws://dex-api.slope.finance/slope-dex-api/ws",
    FlavorSymbol.appDev: "ws://192.168.0.106:8005/slope-dex-api/ws",
    FlavorSymbol.appTest: "ws://47.115.31.125:8005/slope-dex-api/ws",
  };

  @override
  Future<void> init() async {
    // await _configHttpsCertificate();
    return null;
  }

// Future _configHttpsCertificate() async {
// ByteData data = await rootBundle.load('assets/raw/koolio_global.crt');
// SecurityContext context = SecurityContext.defaultContext;
// context.setTrustedCertificatesBytes(data.buffer.asUint8List());
//   return null;
// }

}
