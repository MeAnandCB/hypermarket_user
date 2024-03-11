import 'package:hypermarket_user/core/app_utils/app_utils.dart';
import 'package:hypermarket_user/repository/api/purchase_screen/model/purchase_screen_services.dart';
import 'package:hypermarket_user/repository/helper/api_helper.dart';
import 'package:hypermarket_user/repository/helper/api_response.dart';

class HistoryScreenServices {
  //function to get course detils

  Future<APIResponse> getHistory() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/order-history/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print("***************************************ERROR");
        return response;
      } else {
        PurchaseScreenResModel resData =
            PurchaseScreenResModel.fromJson(response.data);
        print("***************************************$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(data: "resData", error: true, errorMessage: '');
    }
  }
}
