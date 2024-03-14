import 'package:flutter/material.dart';

import 'package:hypermarket_user/repository/api/product_list_screen/model/product_model.dart';
import 'package:hypermarket_user/repository/api/product_list_screen/service/product_service.dart';

class ProductScreenController extends ChangeNotifier {
  bool isProductLoading = true;
  List<DataRes> productListnList = [];

  Future<List<DataRes>> getProductList({required String id}) async {
    isProductLoading = true;
    notifyListeners();
    print(id);
    final fetchedData = await ProductScreenServices().getProductDetials(id: id);
    if (fetchedData.error != true) {
      ProductScreenModel productModel = fetchedData.data;
      productListnList = productModel.productData ?? [];
    }

    isProductLoading = false;
    notifyListeners();

    print(productListnList.toString());
    return productListnList;
  }
}
