import 'package:flutter/material.dart';
import 'package:hypermarket_user/presentation/bottom_nav_screen/view/bottom_nav_screen.dart';
import 'package:hypermarket_user/presentation/cart_screen/controller/cart_screen_controller.dart';
import 'package:hypermarket_user/presentation/login_screen/controller/login_controller.dart';
import 'package:hypermarket_user/presentation/product_details_screen/controller/product_details_screen_controller.dart';
import 'package:hypermarket_user/presentation/registration__screen/controller/register_screen_controller.dart';
import 'package:hypermarket_user/presentation/splash_screen/splash_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ProductDetailsScreenController()),
        ChangeNotifierProvider(create: (context) => CartScreenController()),
        ChangeNotifierProvider(
            create: (context) => RegistrationScreenController()),
        ChangeNotifierProvider(create: (context) => LoginScreenController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
