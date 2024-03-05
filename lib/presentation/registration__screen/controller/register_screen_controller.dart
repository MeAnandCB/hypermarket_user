import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/api/regiter_screen/services/register_screen.dart';

class RegistrationScreenController extends ChangeNotifier {
  bool isPostLoading = false;
  late SharedPreferences sharedPreferences;
  Future<bool> onRegister(
      {required String password,
      required String name,
      String? email,
      required String dob,
      required String gender,
      required String phone}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    isPostLoading = true;
    notifyListeners();
    try {
      // need to update values from  user input
      final fetchedData =
          await RegistrationScreenServides().onRegistration(body: {
        "full_name": name,
        "password": password,
        "phone": phone,
        "dob": dob,
        "gender": gender
      });
      if (fetchedData.error != true) {
        isPostLoading = false;
        notifyListeners();
        return true;
      } else {
        isPostLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isPostLoading = false;
      notifyListeners();
      return false;
    }
  }
}
