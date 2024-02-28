import 'package:flutter/material.dart';
import 'package:hypermarket_user/presentation/bottom_nav_screen/view/bottom_nav_screen.dart';
import 'package:hypermarket_user/presentation/registration__screen/view/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isRegistered =
        prefs.containsKey('username') && prefs.containsKey('password');

    if (isRegistered) {
      // User is already registered, navigate to login screen
      Future.delayed(Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavScreen(),
          ),
        );
      });
    } else {
      // User is not registered, navigate to registration screen after 3 seconds
      Future.delayed(Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RegistrationScreen(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
