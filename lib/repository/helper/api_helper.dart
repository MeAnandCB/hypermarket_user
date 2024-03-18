import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hypermarket_user/app_config/app_config.dart';
import 'package:hypermarket_user/core/app_utils/app_utils.dart';
import 'package:hypermarket_user/presentation/splash_screen/controller/app_config_controller.dart';
import 'package:hypermarket_user/repository/helper/api_response.dart';

class ApiHelper {
  static Map<String, String> getApiHeader({String? access, String? dbName}) {
    AppUtils.logger.d("Access : Bearer $access");

    if (access != null) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access'
      };
    } else if (dbName != null) {
      return {'Content-Type': 'application/json', 'dbName': dbName};
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }

  static getData(
      {required String endPoint,
      required Map<String, String> header,
      String? finalUrl}) async {
    if (await AppUtils.isOnline()) {
      try {
        final uri = Uri.parse(finalUrl ?? (AppConfig.baseUrl + endPoint));
        AppUtils.logger.i(uri);
        // AppUtils.logger.i(uri);
        final res = await http.get(uri, headers: header);
        AppUtils().printData('getData res ${utf8.decode(res.bodyBytes)}');
        if (isRequestSucceeded(res.statusCode)) {
          var resBody = json.decode(utf8.decode(res.bodyBytes));

          print("***************************************ERROR $resBody");

          if (res.statusCode == 200) {
            // if (resBody['message'] != null) {
            //   AppUtils.oneTimeSnackBar(
            //     resBody['message'] ?? "Success",
            //     context: AppConfigController.navigatorState.currentContext!,
            //   );
            // }

            print(resBody);
            print("***************************************ERROR2");
            return APIResponse(data: resBody, error: false, errorMessage: '');
          } else {
            AppUtils.oneTimeSnackBar(
              resBody['message'] ?? 'Something went wrong!',
              context: AppConfigController.navigatorState.currentContext!,
              bgColor: Colors.red,
            );
            print("***************************************ERROR3");
            return APIResponse(
                data: resBody,
                error: true,
                errorMessage: resBody['message'] ?? 'Something went wrong!');
          }
        } else {
          print("***************************************ERROR3");
          return APIResponse(
              data: '', error: true, errorMessage: 'Something went wrong!');
        }
      } catch (e) {
        print("***************************************ERROR4");
        return APIResponse(
            data: '', error: true, errorMessage: 'Could\'t reach server');
      }
    } else {
      if (AppConfigController.navigatorState.currentContext!.mounted) {
        await AppUtils.oneTimeSnackBar("No internet connection",
            bgColor: Colors.red,
            context: AppConfigController.navigatorState.currentContext!);
      }
      print("***************************************ERROR5");
      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }
  }

  //for post
  ///endpoint is applied olny if finalUrl is empty
  static Future<APIResponse> postData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body,
      String? finalUrl}) async {
    // AppUtils().printData('$body');
    // AppUtils().printData('postData');
    // AppUtils().printData('header $header');
    if (await AppUtils.isOnline()) {
      try {
        final uri = Uri.parse(finalUrl ?? AppConfig.baseUrl + endPoint);
        AppUtils.logger.i(uri);

        final res =
            await http.post(uri, headers: header, body: jsonEncode(body));
        AppUtils().printData('getData res ${utf8.decode(res.bodyBytes)}');

        print(res.body);
        if (isRequestSucceeded(res.statusCode)) {
          var resBody = json.decode(utf8.decode(res.bodyBytes));
          print('post resBody');
          print(resBody);
          if (res.statusCode == 200) {
            // if (resBody['message'] != null) {
            //   AppUtils.oneTimeSnackBar(
            //     resBody['message'] ?? "Success",
            //     context: AppConfigController.navigatorState.currentContext!,
            //   );
            // }
            return APIResponse(data: resBody, error: false, errorMessage: '');
          } else {
            AppUtils.oneTimeSnackBar(
              resBody['message']?.toString() ?? 'Something went wrong!',
              context: AppConfigController.navigatorState.currentContext!,
              bgColor: Colors.red,
            );
            return APIResponse(
                data: resBody,
                error: true,
                errorMessage:
                    resBody['message'].toString() ?? 'Something went wrong!');
          }
        } else {
          var resBody = json.decode(utf8.decode(res.bodyBytes));

          AppUtils.oneTimeSnackBar(
            resBody['message']?.toString() ?? 'Something went wrong!',
            context: AppConfigController.navigatorState.currentContext!,
            bgColor: Colors.red,
          );
          // AppUtils.oneTimeSnackBar('Something went wrong!');
          return APIResponse(
              data: res.body,
              error: true,
              errorMessage: 'Something went wrong!');
        }
      } catch (e) {
        return APIResponse(
            data: '', error: true, errorMessage: 'Could\'t reach server');
      }
    } else {
      if (AppConfigController.navigatorState.currentContext!.mounted) {
        await AppUtils.oneTimeSnackBar("No internet connection",
            bgColor: Colors.red,
            context: AppConfigController.navigatorState.currentContext!);
      }

      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }
  }

  //patch
  static Future<APIResponse> patchData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body}) async {
    AppUtils().printData('$body');
    AppUtils().printData('postData');
    AppUtils().printData('header $header');
    if (await AppUtils.isOnline()) {
      // AppUtils().printData('$body');
      // AppUtils().printData('patch body above');
      try {
        final uri = Uri.parse(AppConfig.baseUrl + endPoint);
        AppUtils.logger.i(uri);

        // AppUtils.logger.i(uri);
        // print(header);
        final res =
            await http.patch(uri, headers: header, body: jsonEncode(body));
        AppUtils().printData('getData res ${utf8.decode(res.bodyBytes)}');

        print(res.body);
        if (isRequestSucceeded(res.statusCode)) {
          var resBody = json.decode(utf8.decode(res.bodyBytes));
          print('post resBody');
          print(resBody);
          if (res.statusCode == 200) {
            if (resBody['message'] != null) {
              AppUtils.oneTimeSnackBar(
                resBody['message'] ?? "Success",
                context: AppConfigController.navigatorState.currentContext!,
              );
            }
            return APIResponse(data: resBody, error: false, errorMessage: '');
          } else {
            AppUtils.oneTimeSnackBar(
              resBody['message'] ?? 'Something went wrong!',
              context: AppConfigController.navigatorState.currentContext!,
              bgColor: Colors.red,
            );
            return APIResponse(
                data: resBody,
                error: true,
                errorMessage:
                    resBody['message'].toString() ?? 'Something went wrong!');
          }
        } else {
          return APIResponse(
              data: res.body,
              error: true,
              errorMessage: 'Something went wrong!');
        }
      } catch (e) {
        return APIResponse(
            data: '', error: true, errorMessage: 'Could\'t reach server');
      }
    } else {
      if (AppConfigController.navigatorState.currentContext!.mounted) {
        await AppUtils.oneTimeSnackBar("No internet connection",
            bgColor: Colors.red,
            context: AppConfigController.navigatorState.currentContext!);
      }
      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }
  }

//Delete

  static Future<APIResponse> deleteData(
      {required String endPoint,
      required Map<String, String> header,
      required Map<String, dynamic> body}) async {
    if (await AppUtils.isOnline()) {
      // AppUtils().printData('$body');
      // AppUtils().printData('patch body above');
      try {
        final uri = Uri.parse(AppConfig.baseUrl + endPoint);
        AppUtils.logger.i(uri);

        // AppUtils.logger.i(uri);
        // print(header);
        final res =
            await http.delete(uri, headers: header, body: jsonEncode(body));
        print(res.body);
        if (isRequestSucceeded(res.statusCode)) {
          var resBody = json.decode(utf8.decode(res.bodyBytes));
          print('post resBody');
          print(resBody);
          if (res.statusCode == 200) {
            if (resBody['message'] != null) {
              AppUtils.oneTimeSnackBar(
                resBody['message'] ?? "Success",
                context: AppConfigController.navigatorState.currentContext!,
              );
            }
            return APIResponse(data: resBody, error: false, errorMessage: '');
          } else {
            AppUtils.oneTimeSnackBar(
              resBody['message'] ?? 'Something went wrong!',
              context: AppConfigController.navigatorState.currentContext!,
              bgColor: Colors.red,
            );
            return APIResponse(
                data: resBody,
                error: true,
                errorMessage:
                    resBody['message'].toString() ?? 'Something went wrong!');
          }
        } else {
          return APIResponse(
              data: res.body,
              error: true,
              errorMessage: 'Something went wrong!');
        }
      } catch (e) {
        return APIResponse(
            data: '', error: true, errorMessage: 'Could\'t reach server');
      }
    } else {
      if (AppConfigController.navigatorState.currentContext!.mounted) {
        await AppUtils.oneTimeSnackBar("No internet connection",
            bgColor: Colors.red,
            context: AppConfigController.navigatorState.currentContext!);
      }
      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }
  }

  static bool isRequestSucceeded(int statusCode) {
    AppUtils().printData(statusCode, info: "statusCode");

    return statusCode >= 200 && statusCode <= 404 || statusCode == 500;
  }
}
