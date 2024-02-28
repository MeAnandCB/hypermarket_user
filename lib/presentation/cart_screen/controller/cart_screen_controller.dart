import 'package:flutter/material.dart';

class CartScreenController extends ChangeNotifier {
  int cartValue = 1;

  void quandityadd() {
    cartValue = cartValue + 1;
    notifyListeners();
  }

  void quandityRemove() {
    if (cartValue == 1) {
      cartValue = cartValue;
    } else {
      cartValue = cartValue - 1;
    }

    notifyListeners();
  }
}
