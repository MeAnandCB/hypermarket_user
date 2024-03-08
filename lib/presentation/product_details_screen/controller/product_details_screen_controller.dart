import 'package:flutter/material.dart';
import 'package:hypermarket_user/repository/api/product_details/model/product_details_screen.dart';
import 'package:hypermarket_user/repository/api/product_details/sevices/service.dart';

class ProductDetailsScreenController extends ChangeNotifier {
  int value = 1;
  bool isLoading = true;
  Data? productDataList;
  double totalProdPrice = 0.0;

  Future<Data> getProductDetailsScreenList({required String id}) async {
    isLoading = true;
    notifyListeners();
    final fetchedData =
        await ProductDetailsScreenServices().getProductDetialsScreen(id: id);
    print(fetchedData.error);
    if (fetchedData.error != true) {
      ProductDetailsResModel productdetailsModel = fetchedData.data;
      productDataList = productdetailsModel.productDetalsData;
      isLoading = false;
    }

    notifyListeners();

    print(productDataList);

    return productDataList!;
  }

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

  reset() {
    value = 1;
    notifyListeners();
  }

  totalprice({required String price}) {
    double price = double.parse(productDataList?.price ?? "0.00");

    double totalPrice = price * value;
    totalProdPrice = totalPrice;
  }
}
