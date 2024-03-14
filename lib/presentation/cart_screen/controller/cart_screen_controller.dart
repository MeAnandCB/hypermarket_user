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
    }

    cartitemListLoading = false;
    notifyListeners();

    print(cartitemList);

    return cartitemList;
  }

  Future deleteCartItem({required String id}) async {
    cartitemListLoading = true;
    notifyListeners();

    try {
      final deleteData =
          await CartProductListScreenServices().deleteCart(id: id);
      if (deleteData.error != true) {
        print(deleteData.error);
        await getCartItems();
      }

      cartitemListLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
