import 'package:flutter/material.dart';
import 'package:hypermarket_user/repository/api/scanner_product_screen/model/scanner_screen_model.dart';
import 'package:hypermarket_user/repository/api/scanner_product_screen/services/scanner_product_services.dart';

class scanedDetailsScreenController extends ChangeNotifier {
  int value = 1;
  bool isLoading = true;
  bool isaddtocartloading = false;
  bool ispurchase = false;
  Data? ScannedproductData;
  double totalProdPrice = 0.0;
//here to getProductDetailsScreenList
  Future<Data> getProductDetailsScreenList({required String id}) async {
    isLoading = true;
    notifyListeners();
    final fetchedData = await ScannerProductDetailsScreenServices()
        .getScanProductDetialsScreen(scannedid: id);
    print(fetchedData.error);
    if (fetchedData.error != true) {
      ScannedProductDetailsResModel productdetailsModel = fetchedData.data;
      ScannedproductData = productdetailsModel.productDetalsData;
      isLoading = false;
    }

    notifyListeners();

    print(ScannedproductData);

    return ScannedproductData!;
  }
}
