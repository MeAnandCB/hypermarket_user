import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hypermarket_user/core/constants/color.dart';
import 'package:hypermarket_user/core/database/db_data.dart';
import 'package:hypermarket_user/presentation/cart_screen/view/cart_screen.dart';
import 'package:hypermarket_user/presentation/product_details_screen/view/product_details_screen.dart';
import 'package:hypermarket_user/presentation/product_screen/view/widgets/custom_product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryGreen,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                      ),
                    ),
                  ),
                  Text(
                    "Product List",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
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
                      child: Icon(
                        Icons.shopping_cart,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Search...",
                  ),
                  Icon(Icons.search)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(
                          MediaQuery.of(context).size.width, 100.0)),
                  color: Colors.white,
                ),
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),

                  child: GridView.builder(
                      itemCount: DbData.myItems[0]['items'].length,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(),
                                ));
                          },
                          child: CustomItemCard())),
                  // child: Column(
                  //   children: [
                  //     CustomMovieCards(
                  //       height: 200,
                  //       width: 200,
                  //       title: "Preview",
                  //       imagesList: DbData.movieImageUrls1,
                  //     ),
                  //   ],
                  // )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
