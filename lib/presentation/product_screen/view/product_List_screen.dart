import 'package:flutter/material.dart';
import 'package:hypermarket_user/core/constants/color.dart';

import 'package:hypermarket_user/presentation/cart_screen/view/cart_screen.dart';
import 'package:hypermarket_user/presentation/product_details_screen/controller/product_details_screen_controller.dart';
import 'package:hypermarket_user/presentation/product_details_screen/view/product_details_screen.dart';
import 'package:hypermarket_user/presentation/product_screen/controller/product_screen_controller.dart';
import 'package:hypermarket_user/presentation/product_screen/view/widgets/custom_product_card.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.produtid});
  final String produtid;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<ProductScreenController>(context, listen: false)
          .getProductList(id: widget.produtid);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductScreenController>(context);

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
                      itemCount: productProvider.productListnList.length,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            print(productProvider.productListnList[index].id
                                .toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    index: index,
                                    id: productProvider
                                        .productListnList[index].id
                                        .toString(),
                                  ),
                                ));
                          },
                          child: productProvider.isProductLoading
                              ? CircularProgressIndicator()
                              : CustomItemCard(
                                  image: productProvider
                                          .productListnList[index].image ??
                                      '',
                                  name: productProvider
                                          .productListnList[index].name ??
                                      "",
                                  price: productProvider
                                      .productListnList[index].price
                                      .toString(),
                                ))),
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
