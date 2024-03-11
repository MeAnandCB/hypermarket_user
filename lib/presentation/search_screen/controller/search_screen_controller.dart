import 'package:flutter/material.dart';

import 'package:hypermarket_user/repository/api/search_screen/model/searchScreen_model.dart';
import 'package:hypermarket_user/repository/api/search_screen/services/search_screen_services.dart';

class SearchScreenScreenController extends ChangeNotifier {
  bool isSearchLoading = true;
  List<SearchScreenData> searchData = [];

  Future<List<SearchScreenData>> getsearchList({required String quary}) async {
    isSearchLoading = true;
    notifyListeners();
    final fetchedData =
        await SearchScreenServices().getSearchData(quary: quary);
    if (fetchedData.error != true) {
      SearchScreenResModel categortModel = fetchedData.data;
      searchData = categortModel.searchdata ?? [];
      print("###################################$searchData");
    }

    isSearchLoading = false;
    notifyListeners();

    print(searchData);

    return searchData;
  }
}
