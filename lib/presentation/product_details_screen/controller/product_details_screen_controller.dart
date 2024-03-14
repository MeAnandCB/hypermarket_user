import 'package:flutter/material.dart';
import 'package:hypermarket_user/repository/api/product_details/model/product_details_screen.dart';
import 'package:hypermarket_user/repository/api/product_details/services/service.dart';

class ProductDetailsScreenController extends ChangeNotifier {
  int quantity = 1;
  bool getProductLoading = true;
  bool isaddtocartloading = false;
  bool ispurchase = false;
  Data? productData;
  double totalProdPrice = 0.0;

  Future<Data> getProductDetailsScreenList({required String id}) async {
    getProductLoading = true;
    notifyListeners();
    final fetchedData =
        await ProductDetailsScreenServices().getProductDetialsScreen(id: id);
    print(fetchedData.error);
    if (fetchedData.error != true) {
      ProductDetailsResModel productdetailsModel = await fetchedData.data;
      productData = productdetailsModel.productDetalsData;
    }
    getProductLoading = false;
    notifyListeners();
    print(productData);
    return productData!;
  }

  void incrementQuantity() {
    quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }

  resetQuantity() {
    quantity = 1;
    notifyListeners();
  }

  calculateTotalPrice({required String prices}) {
    double price = double.parse(prices);
    double totalPrice = price * quantity;
    totalProdPrice = totalPrice;
    notifyListeners();
  }

  Future<Data> addtocart({required String id}) async {
    isaddtocartloading = true;
    notifyListeners();
    await ProductDetailsScreenServices().addtoCart(id: id);
    isaddtocartloading = false;
    notifyListeners();
    print(productData);
    return productData!;
  }

  Future<Data> purchase({required int pro_id, required int quantity}) async {
    ispurchase = true;
    notifyListeners();
    final purchase = await ProductDetailsScreenServices()
        .buyProducts(pro_id: pro_id, quantity: quantity);
    if (purchase.error != true) {
      print("order placed successfully");
    }
    ispurchase = false;
    notifyListeners();
    print(productData);
    return productData!;
  }
}
