import 'package:hypermarket_user/repository/api/login_screen/models/login_res_model.dart';
import 'package:hypermarket_user/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class LoginScreenServides {
  Future<APIResponse> onLogin({required Map<String, dynamic> body}) async {
    try {
      final APIResponse response = await ApiHelper.postData(
          body: body, endPoint: "/login/", header: ApiHelper.getApiHeader());
      if (response.error) {
        print("hello login response");
        return response;
      } else {
        print("hello login response success");
        LoginResModel redData = LoginResModel.fromJson(response.data);
        return APIResponse(data: redData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
