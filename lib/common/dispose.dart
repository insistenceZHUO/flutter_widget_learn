import 'package:widget_details/pages/demo/Mnmonice/EnglishMnemonice.dart';

class DisposeArray {
//  数组去空
  static removeEmpty({required List<String> list}) {
    list.removeWhere((element) => element.isEmpty);
    return list;
  }

  /// 提取开头首字母的集合
  static Map extractFirstWordList() {
    Map<String, List<String>> newlist = {};
    word.forEach((element) {
      newlist[element] = [];
      MnmoniceListData.forEach((item) {
        if (item[0] == element) {
          newlist[element]!.add(item);
        }
      });
    });
    return newlist;
  }
}

final word = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z'
];

main() {
  // MnmoniceListData.forEach((element) {});
}
