import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:hypermarket_user/core/database/db_data.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 20),
          //   color: ColorConstant.primaryGreen,
          //   child: Column(
          //     children: [

          //     ],
          //   ),
          // ),
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
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //   height: 60,
          //   child: ListView.separated(
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index) =>
          //           Text(DbData.myItems[index]["category"]),
          //       separatorBuilder: (context, index) => SizedBox(
          //             width: 10,
          //           ),
          //       itemCount: DbData.myItems.length),
          // ),
          SizedBox(height: 15),
          Text(
            "You might need",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: DbData.myItems.length,
            itemBuilder: (context, index) => CustomProductCard(
              myindex: index,
            ),
          )
        ],
      ),
    );
  }
}

class CustomProductCard extends StatelessWidget {
  final int myindex;
  const CustomProductCard({
    super.key,
    required this.myindex,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: DbData.myItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          mainAxisExtent: 170),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), border: Border.all()),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Image.network(
                  DbData.myItems[myindex]["items"][index]["image"],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(DbData.myItems[myindex]["items"][index]["name"]),
            Text(
              "Price :${DbData.myItems[myindex]["items"][index]["price"]}",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
