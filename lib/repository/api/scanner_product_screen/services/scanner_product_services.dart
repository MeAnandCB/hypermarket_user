import 'package:hypermarket_user/core/app_utils/app_utils.dart';
import 'package:hypermarket_user/repository/api/product_details/model/product_details_screen.dart';
import 'package:hypermarket_user/repository/api/scanner_product_screen/model/scanner_screen_model.dart';
import 'package:hypermarket_user/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class ScannerProductDetailsScreenServices {
  //function to get course detils

  Future<APIResponse> getScanProductDetialsScreen(
      {required String scannedid}) async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/product/$scannedid/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print("***************************************ERRORdone");
        return response;
      } else {
        print("hello");
        ScannedProductDetailsResModel resData =
            ScannedProductDetailsResModel.fromJson(response.data);
        print("hell2o");

        print("***************************************$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      rethrow;
    }
  }
}
