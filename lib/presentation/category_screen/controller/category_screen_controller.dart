import 'package:flutter/material.dart';
import 'package:hypermarket_user/repository/api/category_screen/model/category_screen_model.dart';
import 'package:hypermarket_user/repository/api/category_screen/model/favorate_screen_model.dart';
import 'package:hypermarket_user/repository/api/category_screen/services/category_screen.dart';

class CategoryScreenController extends ChangeNotifier {
  bool isCategoryLoading = true;
  bool isFavorateLoading = true;
  List<Data> categoryScreenList = [];
  List<FavorateData> favorateList = [];

  Future<List<Data>> getCategoryList() async {
    isCategoryLoading = true;
    notifyListeners();
    final fetchedData = await CategoryScreenServices().getCategoryDetials();
    if (fetchedData.error != true) {
      CategoryListResModel categortModel = fetchedData.data;
      categoryScreenList = categortModel.responseData ?? [];
      print("###################################$categoryScreenList");
    }

    isCategoryLoading = false;
    notifyListeners();

    print(categoryScreenList);

    return categoryScreenList;
  }

  //here get the ML Data
  Future<List<FavorateData>> getFavorateList() async {
    isFavorateLoading = true;
    notifyListeners();
    final fetchedData = await CategoryScreenServices().getFavorateDetials();
    if (fetchedData.error != true) {
      FavorateScreenResModel favModel = fetchedData.data;
      favorateList = favModel.favorateData ?? [];
      print("###################################$favorateList");
    }

    isFavorateLoading = false;
    notifyListeners();

    print(favorateList);

    return favorateList;
  }
}
