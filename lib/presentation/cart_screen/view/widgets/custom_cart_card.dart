import 'package:flutter/material.dart';
import 'package:hypermarket_user/app_config/app_config.dart';
import 'package:hypermarket_user/core/constants/color.dart';
import 'package:hypermarket_user/presentation/cart_screen/controller/cart_screen_controller.dart';
import 'package:hypermarket_user/presentation/product_details_screen/view/product_details_screen.dart';
import 'package:provider/provider.dart';

class CustomCartItem extends StatefulWidget {
  const CustomCartItem({
    super.key,
    required this.image,
    required this.price,
    required this.category,
    required this.name,
    this.delete,
    required this.inx,
  });

  final String image;
  final String name;
  final String price;
  final String category;
  final int inx;
  final VoidCallback? delete;

  @override
  State<CustomCartItem> createState() => _CustomCartItemState();
}

class _CustomCartItemState extends State<CustomCartItem> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartScreenController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: Image.network(
                    AppConfig.mediaUrl + widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: ColorConstant.mainBlack),
                    ),
                    Text(widget.category),
                    Text(
                      widget.price,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: ColorConstant.mainBlack),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: widget.delete,
                  icon: Icon(
                    Icons.delete,
                    size: 25,
                    color: ColorConstant.mainRed,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                            id: cartProvider
                                    .cartitemList[widget.inx].product?.id
                                    .toString() ??
                                "",
                          ),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryGreen,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorConstant.hyperGrey)),
                    width: MediaQuery.sizeOf(context).width * .30,
                    child: Container(
                      child: Center(
                        child: Center(
                            child: Text(
                          "Buy Now",
                          style: TextStyle(color: ColorConstant.mainWhite),
                        )),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

                                    //  AppConfig.mediaUrl+cartProvider.cartitemList[index].product
                                    //           ?.image ,