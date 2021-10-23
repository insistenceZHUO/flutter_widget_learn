import 'package:dio/dio.dart';

import 'base_http.dart';

abstract class BaseProtocol {
  int? code;
  String? msg;
  dynamic data;

  bool get isSuccess => (null != data) && (false == (this.data is WDError));

  void parse(dynamic data) {
    if (isSuccess) {
      onParse(data);
    } else {
      if (this.data is WDError) {
        WDError e = this.data as WDError;
        parseError(e);
        if (e.hasErrResponse) {
          onParseErrorFromResponse(e.errResponse!);
        }
      } else {
        parseError(WDError());
      }
    }
  }

  void onParse(dynamic data);

  void onParseErrorFromResponse(Response errResponse) {
    /// 后台自定义的错误可以根据不同接口用errResponse.data单独解析
    ///
    /// 默认解析
    // this.code = errResponse.statusCode;
    // this.msg = '${this.code}: ${errResponse.data}';
  }

  void parseError(WDError error) {
    this.code = error.errorCode;
    this.msg = error.errorMsg;
  }
}
