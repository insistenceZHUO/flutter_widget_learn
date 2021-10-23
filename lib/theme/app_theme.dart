import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wd_common_package/wd_common_package.dart';
import 'package:widget_details/common/config/i_config.dart';

class ThemeModeSymbol {
  static final system = "system";
  static final dark = "dark";
  static final light = "light";

  const ThemeModeSymbol._internal();
}

AppColors? _appColors;

class AppColors {}

class AppTheme extends ViewModel with IConfig {
  static AppTheme of(context) => Provider.of(context, listen: true);

  /// 主题key
  static final String themeModeSymbolKey = "themeModeSymbolKey";

  ///  默认为dark
  static final String defaultSymbol = ThemeModeSymbol.light;

  ThemeMode? _themeMode;

  // ThemeMode

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }
}
