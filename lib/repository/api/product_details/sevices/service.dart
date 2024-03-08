import 'package:hypermarket_user/core/app_utils/app_utils.dart';
import 'package:hypermarket_user/repository/api/product_details/model/product_details_screen.dart';
import 'package:hypermarket_user/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class ProductDetailsScreenServices {
  //function to get course detils

  Future<APIResponse> getProductDetialsScreen({required String id}) async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/product/$id/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print("***************************************ERRORdone");
        return response;
      } else {
        print("hello");
        ProductDetailsResModel resData =
            ProductDetailsResModel.fromJson(response.data);
        print("hell2o");

        print("***************************************$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      rethrow;
      return APIResponse(data: "resData", error: true, errorMessage: '');
    }
  }
}