import 'package:flutter/material.dart';
import 'package:hypermarket_user/repository/api/product_list_screen/service/product_service.dart';
import 'package:hypermarket_user/repository/api/purchase_screen/model/purchase_screen_services.dart';
import 'package:hypermarket_user/repository/api/purchase_screen/services/purchase_service.dart';

class HistoryScreenController extends ChangeNotifier {
  bool isProductLoading = true;
  List<PurchaseRes> purchaseHistory = [];

  Future<List<PurchaseRes>> getHistoryList() async {
    isProductLoading = true;
    notifyListeners();

    final fetchedData = await HistoryScreenServices().getHistory();
    if (fetchedData.error != true) {
      PurchaseScreenResModel productModel = fetchedData.data;
      print("###################################$productModel");
      purchaseHistory = productModel.purchaseData ?? [];
      print("###################################$purchaseHistory");
    }

    isProductLoading = false;
    notifyListeners();

    print(purchaseHistory.toString());

    return purchaseHistory;
  }
}
