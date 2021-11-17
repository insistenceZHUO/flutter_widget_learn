main() {
  /// 创建一个包含指定类型的数组;
  var empty = List<int>.empty(growable: false);
  // empty[0] =1;
  // print('empty:$empty');

  ///
  var listFill = List<int>.filled(5, 3, growable: true);
  print('listFill:$listFill');

  /// 创建一个指定长度的list;
  ///
  var listGenerate = List<int>.generate(8, (index) => index);

  /// 获取数组的第一个元素
  List<int> list = [1, 2, 3, 4];
  print('获取数组的第一个元素--first.first:${list.first}');

  /// 获取数组中最后的一个元素;
  print('获取数组的第一个元素--last.last:${list.last}');

  /// 删除列表中的所有元素;
  // list.clear();
  print('list:${list}'); // [];
  // print('list.iterator:${list.iterator}');
  //   print('list.single:${list.single}');

  /// 判断数组是否为空;
  bool isEmpty1 = [].isEmpty; // true;
  bool isEmpty2 = [1].isEmpty; // false;

  ///判断数组是否不为空
  bool isNotEmpty1 = [].isNotEmpty; // false
  bool isNotEmpty2 = [1].isNotEmpty; // true

  /// flutter any
  // 判断数组中的元素是否符合条件,只需要有一个元素满足条件。返回值就为true;
  bool any1 = list.any((element) => element > 4); // false
  bool any2 = list.any((element) => element > 3); // true
  print('any1:$any1');
  print('any2:$any2');

  // // 将数组转化为map
  // map.keys
  // var add= map[0] + map[1];
  // print('map.keys:${map.keys.toList()}');

  /// 判断数据是否包含指定的值;
  bool contains1 = list.contains(5);
  bool contains2 = list.contains(4);
  print('contains1:$contains1'); // false
  print('contains2:$contains2'); // true;

  /// elementAt;
  var elementAt = list.elementAt(2);
  print('elementAt:${elementAt}'); //2  返回指定位置的元素; 位置不能大于数组的长度;

  /// expand;展开数组；跟js flat相似; 可以将2维数组转化为1维数组;
  var pairs = [
    [1, 2],
    [3, 4]
  ];
  var flattened = pairs.expand((pair) => pair).toList();
  print('flattened:$flattened'); // => [1, 2, 3, 4];

  /// fillRange 替换指定位置的元素;
  var fillRange = List.filled(5, -1);
  fillRange.fillRange(0, 3, 8);
  print('fillRange:${fillRange}');

  /// firstWhere返回满足条件的第一个元素;
  var firstWhere = list.firstWhere((element) => element > 1, orElse: (){
    return -1;
  });
  print('firstWhere:$firstWhere');

  /// lastWhere返回满足条件的最后一个元素
  var lastWhere = list.lastWhere((element) => element > 1, orElse: (){
    return -1;
  });
  print('lastWhere:$lastWhere');

  /// fold相加;
  final fold = [1, 2, 3];

  var a = fold.fold<int>(10, (x, y) => x + y);

  print(a); // 16;

  print('fold:$fold');

  Iterable<int> iterable11 = List.from([1, 2, 3]);

  print('iterable11.first:${iterable11.first}');

  var list4 = [1, 2, 3, 4, 5];
  Iterable<int> followedBy = list4.followedBy([11, 12, 12, 11]);
  print('followedBy:${followedBy}');

  /// (1, 2, 3, 4, 5, 11, 12, 12)
  ///
  /// indexWidth: 返回第一个满足条件的位置; 第二个参数是查找的开始位置;
  var notes = ['do', 're', 'mi', 're'];
  notes.indexWhere((note) => note.startsWith('r')); // 1
  notes.indexWhere((note) => note.startsWith('r'), 2); // 3

  /// getRange
  ///
  /// 获取指定位置的元素, 返回一个iterable接口;
  List<String> colors = ['red', 'green', 'blue', 'orange', 'pink'];
  Iterable<String> range = colors.getRange(1, 4);
  print('range:${range}');
  range.join(', '); // 'green, blue, orange'
  colors.length = 3;
  range.join(',');

  /// replaceRange;用一组数据替换指定位置的元素;
  var replaceRange = [1, 2, 3, 4, 5];
  replaceRange.replaceRange(1, 4, [6, 7]);
  print('replaceRange:${replaceRange}');

  /// insert在指定的一个位置插入元素, 第一个参数不能为负; 不能大于数组的长度;
  var insert = [1, 2, 3, 4, 5];

  insert.insert(2, 11);

  print('insert:$insert'); // [1, 2, 11, 3,4,5];

  insert.insertAll(6, [0, 0, 0]);

  print('insert:$insert');

  /// list的一些删除操作;

  /// remove; 删除符合条件的第一个条元素;
  var removeList = [1, 2, 3, 4, 2];
  removeList.remove(2);

  print("removeList:${removeList}");

  /// 删除符合条件的最后一个元素;
  var removeLastList = [1, 3, 2, 3, 4];
  removeLastList.removeLast();
  print('removeLastList:${removeLastList}'); // [1, 3, 2, 3];

  /// 删除指定区间的元素;
  var removeRangeList = [1, 2, 3, 4, 5, 6];
  removeRangeList.removeRange(1, 4);
  print('removeRangeList:${removeRangeList}');

  /// removeAt;删除指定位置的元素;
  var removeAtList = ['北京', '上海', '广州'];
  removeAtList.removeAt(2);
  print('removeAtList:${removeAtList}');

  /// removerWhere删除符合条件的元素;
  var removeWhereList = [1, 2, 3, 4, 5, 66, 77, 88, 9];
  removeWhereList.removeWhere((element) => element > 50);

  print('removeWhereList:${removeWhereList}');

  /// retainWhere: 删除不符合条件的元素;
  var retainWhereList = ['one', 'two', 'three', 'four'];
  retainWhereList.retainWhere((element) => element.length == 3);
  print("retainWhereList:${retainWhereList}");

  /// 设置指定区间的元素; // 替换的开始位置;
  var setRangeList1 = [1, 2, 3, 4];

  var setRangeList2 = [5, 6, 7, 8, 9];

  setRangeList1.setRange(1, 3, setRangeList2, 3);
  print("list1:${setRangeList1}"); // [1, 8, 9, 4];

  var setRangeList3 = [1, 2, 3, 4];
  var setRangeList4 = [5, 6, 7, 8, 9];
  setRangeList3.setRange(1, 3, setRangeList4, 1);
  print("setRangeList3:${setRangeList3}"); // [1, 6,7, 4];

  /// 随机整理列表中的元素;
  setRangeList3.shuffle();
  print("setRangeList3:${setRangeList3}");
  var singleWhereList = [1,2,3,4,5,6,7];
  //singleWhere函数的使用，返回符合条件的第一个元素，如果没找到返回null，但是前提是集合中只有一个符合条件的元素, 否则就会抛出异常
  var singleWhereItem =  singleWhereList.singleWhere((element) => element > 7, orElse: (){
    print("没有找到;");
    return -1;
  });
  print("singleWhereItem:${singleWhereItem}");
}
