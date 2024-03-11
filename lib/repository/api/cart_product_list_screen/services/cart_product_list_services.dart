import 'package:hypermarket_user/core/app_utils/app_utils.dart';
import 'package:hypermarket_user/repository/api/cart_product_list_screen/model/cart_product_list_model';

import 'package:hypermarket_user/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class CartProductListScreenServices {
//here is the code for fetch the cart list data
  Future<APIResponse> getCartDetials() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/get-cart-items/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print("***************************************ERROR");
        return response;
      } else {
        GetCartItemsResModel resData =
            GetCartItemsResModel.fromJson(response.data);
        print("***************************************8$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(data: "resData", error: true, errorMessage: '');
    }
  }

  //here is the code for fetch the delete the cart list

  // remove-from-cart/<int:product_id>/
}
