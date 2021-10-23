import 'package:widget_details/common/config/i_config.dart';

import 'app_config.dart';

class WidgetDetailsConfig extends IConfig {
  factory WidgetDetailsConfig() => _getInstance();
  static WidgetDetailsConfig? _Instance;
  static WidgetDetailsConfig get instance => _getInstance();
  WidgetDetailsConfig._internal();

  static WidgetDetailsConfig _getInstance() {
    if (_Instance == null) {
      _Instance = WidgetDetailsConfig._internal();
    }
    return _Instance!;
  }

  final app = AppConfig();
  @override
  Future<void> init() async {
    /// 初始化app
  }
}
