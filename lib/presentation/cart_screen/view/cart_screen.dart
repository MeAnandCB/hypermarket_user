import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hypermarket_user/core/constants/color.dart';
import 'package:hypermarket_user/core/database/db_data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryGreen,
      body: SingleChildScrollView(
        child: Column(
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
                      "Cart",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    InkWell(
                      child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 218, 179, 25),
                          child: Text("1")),
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
                padding: const EdgeInsets.only(top: 50),
                child: ListView.separated(
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
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
                                      "https://www.bigbasket.com/media/uploads/p/xxl/40270541-2_1-bingo-hashtags-spicy-masala-unique-flavour-crispy.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "This is the titile",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: ColorConstant.mainBlack),
                                      ),
                                      Text("56 grams"),
                                      Text(
                                        "300/-",
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
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: ColorConstant.hyperGrey)),
                                    width:
                                        MediaQuery.sizeOf(context).width * .30,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.remove)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text("1"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.add)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
