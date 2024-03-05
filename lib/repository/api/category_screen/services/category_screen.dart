import 'package:hypermarket_user/core/app_utils/app_utils.dart';
import 'package:hypermarket_user/repository/api/category_screen/model/category_screen_model.dart';
import 'package:hypermarket_user/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class CategoryScreenServices {
  //function to get course detils

  Future<APIResponse> getCategoryDetials() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/category/list/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print("***************************************ERROR");
        return response;
      } else {
        CategoryListResModel resData =
            CategoryListResModel.fromJson(response.data);
        print("***************************************8$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(data: "resData", error: true, errorMessage: '');
    }
  }
}
