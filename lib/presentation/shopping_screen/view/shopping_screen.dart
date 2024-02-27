import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:hypermarket_user/core/constants/color.dart';
import 'package:hypermarket_user/core/database/db_data.dart';
import 'package:hypermarket_user/presentation/cart_screen/view/cart_screen.dart';
import 'package:hypermarket_user/presentation/shopping_screen/view/widgets/custom_items_card.dart';

import 'package:hypermarket_user/presentation/shopping_screen/view/widgets/popular_items_widgets.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: ColorConstant.primaryGreen,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi Buddy!",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 30,
                              color: Colors.white),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.shopping_cart),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // Text(
                //   "Current Location :  ${_locationMessage}",
                //   style: TextStyle(color: Color.fromARGB(255, 190, 214, 11)),
                // ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: [
              Image.asset("assets/2.png"),
              Image.asset("assets/3.png"),
              Image.asset("assets/4.png"),
            ],
            options: CarouselOptions(
                enlargeFactor: 5,
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "All your favorate",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 120,
            child: Center(
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => PopularItemcard(
                        index: index,
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                  itemCount: 3),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "You might need",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: DbData.myItems.length,
                  itemBuilder: (context, index) => CustomProductCard(
                    myindex: index,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
