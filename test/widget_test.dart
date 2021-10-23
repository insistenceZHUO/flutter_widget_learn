// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_details/main.dart';

void main() {
  var list = [1,2,3];
  var a = list.elementAt(1);
  print('list:$a');
  print('list:$list');

  var pp = { "a": 100,"b":true,"c":"yy","d":"today","e":"is","f":"a","g":"good","h":"day"};
  print(pp);
  pp["c"]= 5; //更改value
  print(pp.containsKey("today"));
  print(pp.containsValue("today"));
}
