import 'package:flutter/material.dart';
import 'package:hypermarket_user/app_config/app_config.dart';

import 'package:hypermarket_user/core/constants/color.dart';
import 'package:hypermarket_user/presentation/cart_screen/view/cart_screen.dart';
import 'package:hypermarket_user/presentation/category_screen/controller/category_screen_controller.dart';
import 'package:hypermarket_user/presentation/payment_screen/view/payment_screen.dart';
import 'package:hypermarket_user/presentation/product_details_screen/controller/product_details_screen_controller.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen(
      {super.key, required this.id, required this.index});

  final String id;
  final int index;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    print(widget.id);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<ProductDetailsScreenController>(context, listen: false)
          .getProductDetailsScreenList(id: widget.id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductDetailsScreenController>(context);
    productProvider.totalprice(
        price: productProvider.productDataList?.price ?? '');

    String image = productProvider.productDataList?.image ?? "";

    return Scaffold(
      backgroundColor: ColorConstant.primaryGreen,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      "Product Details",
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
            Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: productProvider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              height: 280,
                              width: MediaQuery.of(context).size.width * .75,
                              child: Image.network(
                                AppConfig.mediaUrl + image,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                productProvider.productDataList?.price ?? "",
                                style: TextStyle(
                                    height: 1.7,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            productProvider.productDataList?.name ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            productProvider.productDataList?.description ?? "",
                            style: TextStyle(
                              height: 1.7,
                              fontSize: 14,
                            ),
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.light,
                                color: Colors.purple,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Fast Devivery Available",
                                style: TextStyle(
                                  height: 1.7,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],
                            ),
                            height: 60,
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width / 2,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            productProvider.value > 1
                                                ? Provider.of<
                                                            ProductDetailsScreenController>(
                                                        context,
                                                        listen: false)
                                                    .quandityRemove()
                                                : productProvider.value;
                                          },
                                          child: Container(
                                            child: Center(
                                              child: Icon(Icons.remove),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Center(
                                              child: Text(productProvider.value
                                                  .toString())),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            Provider.of<ProductDetailsScreenController>(
                                                    context,
                                                    listen: false)
                                                .quandityadd();
                                          },
                                          child: Container(
                                            child: Center(
                                              child: Icon(Icons.add),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CartScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      color: Colors.amber,
                                      child: Center(
                                        child: Text("Add to Cart"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Total amount :  "),
                              Text(
                                Provider.of<ProductDetailsScreenController>(
                                        context)
                                    .totalProdPrice
                                    .toString(),
                                style: TextStyle(
                                    height: 1.7,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Provider.of<ProductDetailsScreenController>(context,
                        listen: false)
                    .reset();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
              child: Container(
                height: 60,
                color: Colors.amber,
                child: Center(
                  child: Text("Buy Now"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
