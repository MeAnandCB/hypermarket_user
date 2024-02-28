import 'package:flutter/material.dart';
import 'package:hypermarket_user/presentation/login_screen/view/login_screen.dart';

import 'package:provider/provider.dart';
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

  static void resetProviders(BuildContext context) {
    // Provider.of<HomeBottomTabController>(context, listen: false).resetState();
    // Provider.of<CourseScreenController>(context, listen: false).resetState();
    // Provider.of<BatchClassVideoController>(context, listen: false).resetState();
    // Provider.of<OverviewScreenController>(context, listen: false).resetState();
    // Provider.of<AttendenceScreenController>(context, listen: false).resetState();
    // Provider.of<AssignmentScreenController>(context, listen: false).resetState();
    // Provider.of<AnnouncementScreenController>(context, listen: false).resetState();
    // Provider.of<BatchVideoPlayerScreenController>(context, listen: false)
    //     .resetState();
    // Provider.of<VideoPlayerScreenController>(context, listen: false).resetState();
    // Provider.of<LoginScreenController>(context, listen: false).resetState();
    // Provider.of<CourseDetailsScreenController>(context, listen: false)
    //     .resetState();
    // Provider.of<DemoVideoListScreenController>(context, listen: false)
    //     .resetState();
    // Provider.of<OtpVerificationScreenController>(context, listen: false)
    //     .resetState();
    // Provider.of<LiveClassScreenController>(context, listen: false).resetState();
    // Provider.of<BottomNavbarScreenController>(context, listen: false).resetState();
    // Provider.of<AppConfigController>(context, listen: false).resetState();
  }
}
