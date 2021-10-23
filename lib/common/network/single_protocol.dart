import 'dart:io';
import 'package:dio/dio.dart';

import 'base/base_http.dart';
import 'base/base_protocol.dart';
import 'base/i_request.dart';

enum WDRequestType { get, post }

/// 普通单个请求, 区别于分页请求
///
/// [T] 传入调用者类型
abstract class SingleProtocol<T extends BaseProtocol> extends BaseProtocol
    with IRequest<T> {
  @override
  Future<T> request() async {
    BaseHttp.instance.configBaseUrl(baseUrl);
    BaseHttp.instance.configHeader(header);
    var res = await BaseHttp.instance.open(
      api,
      method: method,
      arguments: arguments,
      cancelToken: cancelToken,
    );
    this.parse(res);
    return this as T;
  }

  @override
  void parse(dynamic data) {
    /// 若有需要,留个入口处理
    this.data = data;
    super.parse(data);
  }

  Future? cancel() {
    cancelToken?.cancel();
    return null;
  }

  /// 请求方法
  WDRequestType get method => WDRequestType.post;

  /// 请求api
  String get api;

  /// 请求参数
  Map<String, dynamic>? get arguments => null;

  /// 取消令牌
  CancelToken? get cancelToken => null;

  /// baseUrl
  String get baseUrl => '';

  /// header
  Map<String, dynamic> get header => {};
}
