import 'package:flutter/material.dart';
import 'package:hypermarket_user/presentation/login_screen/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static void logOut(BuildContext context) {
    // clear shared preferences and navigate to login methode screen
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sp.clear();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (route) => false);
    });
  }

  static Future<void> clearGuestData() async {
    // clear shared preferences data of guest
    await SharedPreferences.getInstance().then((SharedPreferences sp) async {
      await sp.clear();
    });
  }
}
