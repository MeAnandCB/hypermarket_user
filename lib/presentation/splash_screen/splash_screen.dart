import 'package:flutter/material.dart';
import 'package:hypermarket_user/core/app_utils/app_utils.dart';
import 'package:hypermarket_user/presentation/bottom_nav_screen/view/bottom_nav_screen.dart';
import 'package:hypermarket_user/presentation/login_screen/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkRegistrationStatus();
  }

  void checkRegistrationStatus() async {
    print("hello");

    AppUtils.getAccessKey().then((value) async {
      print("hello1");
      print("$value token");
      if (value != null && value.isNotEmpty) {
        print(value);
        print("hello2");
        Future.delayed(Duration(seconds: 3)).then((value) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavScreen(),
            ),
            (route) => false,
          );
        });
      } else {
        // User is not registered, navigate to registration screen after 3 seconds
        Future.delayed(Duration(seconds: 3)).then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: Center(
            child: Image.asset("assets/logo.jpg"),
          ),
        ),
      ),
    );
  }
}
