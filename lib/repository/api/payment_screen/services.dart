import 'package:hypermarket_user/repository/helper/api_helper.dart';
import 'package:hypermarket_user/repository/helper/api_response.dart';

class PaymentScreenServides {
  Future<APIResponse> onRegistration(
      {required Map<String, dynamic> body}) async {
    try {
      final APIResponse response = await ApiHelper.postData(
          body: body,
          endPoint: "/create-order/",
          header: ApiHelper.getApiHeader());
      if (response.error) {
        return response;
      } else {
        return APIResponse(data: "redData", error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
