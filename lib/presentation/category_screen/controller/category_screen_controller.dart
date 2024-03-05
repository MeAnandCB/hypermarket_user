import 'package:flutter/material.dart';
import 'package:hypermarket_user/repository/api/category_screen/model/category_screen_model.dart';
import 'package:hypermarket_user/repository/api/category_screen/services/category_screen.dart';

class CategoryScreenController extends ChangeNotifier {
  bool isCategoryLoading = true;
  List<Data> categoryScreenList = [];

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
}
