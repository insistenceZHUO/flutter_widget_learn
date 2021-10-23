import 'package:flutter/foundation.dart';

class BasicModal extends ChangeNotifier {
  int _count = 0;
  get count => _count;

  set count(value) {
    _count = value;
    notifyListeners();
  }

  add() {
    _count++;
    notifyListeners();
  }

  subtraction() {
    _count--;
    notifyListeners();
  }
}
