import 'package:flutter/material.dart';
import 'package:hypermarket_user/repository/api/cart_product_list_screen/model/cart_product_list_model';
import 'package:hypermarket_user/repository/api/cart_product_list_screen/services/cart_product_list_services.dart';

class CartScreenController extends ChangeNotifier {
  bool cartitemListLoading = true;
  List<Datum> cartitemList = [];

  // get item
  Future<List<Datum>> getCartItems() async {
    cartitemListLoading = true;
    notifyListeners();
    final fetchedData = await CartProductListScreenServices().getCartDetials();
    if (fetchedData.error != true) {
      GetCartItemsResModel cartListModel = fetchedData.data;
      cartitemList = cartListModel.data ?? [];
      print("###################################$cartitemList");
    }

    cartitemListLoading = false;
    notifyListeners();

    print(cartitemList);

    return cartitemList;
  }

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

//this is the function for delete the cart items
}
