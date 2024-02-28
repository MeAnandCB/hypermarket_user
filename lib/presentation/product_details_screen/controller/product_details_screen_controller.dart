import 'package:flutter/material.dart';

class ProductDetailsScreenController extends ChangeNotifier {
  int value = 1;

  void quandityadd() {
    value = value + 1;
    notifyListeners();
  }

  void quandityRemove() {
    if (value == 1) {
      value = value;
    } else {
      value = value - 1;
    }

    notifyListeners();
  }
}
