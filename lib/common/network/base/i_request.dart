import 'package:widget_details/data/bean/page_info_data.dart';

/// 单个请求interface
///
/// [T] 传入调用者类型
abstract class IRequest<T> {
  Future<T> request();
}

/// 分页请求interface
///
/// [T] bean的类型
abstract class IRequestPage<T> {
  Future<PageResult<T>> requestPage(int page, int pageSize);
}

class PageResult<T> {
  List<T> items = [];
  PageInfoBean pageInfo = PageInfoBean();
  PageStatus status = PageStatus.processing;
}

enum PageStatus {
  success, // 请求成功
  failed, // 请求失败
  processing, // 进行中
}
