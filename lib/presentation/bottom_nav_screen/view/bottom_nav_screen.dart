import 'package:flutter/material.dart';
import 'package:hypermarket_user/core/constants/color.dart';
import 'package:hypermarket_user/presentation/profile_screen/view/profile_screen.dart';
import 'package:hypermarket_user/presentation/scanner_screen/view/scanner.dart';
import 'package:hypermarket_user/presentation/shopping_screen/view/shopping_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int seletedIndex = 0;
  List<Widget> _screens = [ShoppingScreen(), ScannerScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[seletedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            seletedIndex = value;
            setState(() {});
          },
          currentIndex: seletedIndex,
          selectedItemColor: ColorConstant.primaryGreen,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Shopping"),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner), label: "Scan"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
