import 'package:hypermarket_user/core/app_utils/app_utils.dart';

import 'package:hypermarket_user/repository/api/search_screen/model/searchScreen_model.dart';
import 'package:hypermarket_user/repository/helper/api_helper.dart';
import 'package:hypermarket_user/repository/helper/api_response.dart';

class SearchScreenServices {
  //function to get course detils

  Future<APIResponse> getSearchData({required String quary}) async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/category/list/?search=$quary",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print("***************************************ERROR");
        return response;
      } else {
        SearchScreenResModel resData =
            SearchScreenResModel.fromJson(response.data);
        print("***************************************$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(data: "resData", error: true, errorMessage: '');
    }
  }
}
