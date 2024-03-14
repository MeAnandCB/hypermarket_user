import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hypermarket_user/app_config/app_config.dart';
import 'package:hypermarket_user/core/constants/color.dart';

class PopularItemcard extends StatelessWidget {
  final int index;
  final String qty;
  final String price;
  final String image;

  const PopularItemcard({
    super.key,
    required this.index,
    required this.qty,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 237, 237, 237),
              spreadRadius: 2,
              blurRadius: 10)
        ],
        color: ColorConstant.cardColor[index],
        borderRadius: BorderRadius.circular(15),
      ),
      width: MediaQuery.of(context).size.width * .60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                qty,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                price,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Free Devivery",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Container(child: Image.network(AppConfig.mediaUrl + image))
        ],
      ),
    );
  }
}
