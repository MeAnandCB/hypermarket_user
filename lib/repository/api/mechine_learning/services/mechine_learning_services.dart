import 'package:hypermarket_user/core/app_utils/app_utils.dart';
import 'package:hypermarket_user/repository/api/product_list_screen/model/product_model.dart';
import 'package:hypermarket_user/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class MechineLearningServices {
  //function to get course detils

  Future<APIResponse> getcarouselData({required String id}) async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/product/carousel/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print("***************************************ERROR");
        return response;
      } else {
        ProductScreenModel resData = ProductScreenModel.fromJson(response.data);
        print("***************************************$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(data: "resData", error: true, errorMessage: '');
    }
  }
}
