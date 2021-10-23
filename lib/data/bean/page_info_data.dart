import 'package:widget_details/common/util/ai_json/ai_json.dart';

class PageInfoBean {
  num first;
  bool hasNext;
  bool hasPre;
  num nextPage;
  num page;
  num pageCount;
  num prePage;
  num size;
  num total;

  PageInfoBean({
    this.first = 0,
    this.hasNext = false,
    this.hasPre = false,
    this.nextPage = 0,
    this.page = 0,
    this.pageCount = 0,
    this.prePage = 0,
    this.size = 0,
    this.total = 0,
  });

  factory PageInfoBean.fromJson(Map<String, dynamic> json) {
    AiJson aJson = AiJson(json);
    return PageInfoBean(
      first: aJson[AiJsonKey.num("first")],
      hasNext: aJson[AiJsonKey.bool('hasNext')],
      hasPre: aJson[AiJsonKey.bool('hasPre')],
      nextPage: aJson[AiJsonKey.num('nextPage')],
      page: aJson[AiJsonKey.num('page')],
      pageCount: aJson[AiJsonKey.num('pageCount')],
      prePage: aJson[AiJsonKey.num('prePage')],
      size: aJson[AiJsonKey.num('size')],
      total: aJson[AiJsonKey.num('total')],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['hasNext'] = this.hasNext;
    data['hasPre'] = this.hasPre;
    data['nextPage'] = this.nextPage;
    data['page'] = this.page;
    data['pageCount'] = this.pageCount;
    data['prePage'] = this.prePage;
    data['size'] = this.size;
    data['total'] = this.total;
    return data;
  }
}
