import 'package:flutter/material.dart';
import 'package:hypermarket_user/core/constants/color.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int seletedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            seletedIndex = value;
            setState(() {});
          },
          currentIndex: seletedIndex,
          selectedItemColor: ColorConstant.primaryGreen,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "shopping"),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner), label: "Scan"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
