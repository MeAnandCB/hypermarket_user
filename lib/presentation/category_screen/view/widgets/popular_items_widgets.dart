import 'package:flutter/material.dart';
import 'package:hypermarket_user/core/constants/color.dart';

class PopularItemcard extends StatelessWidget {
  final int index;
  const PopularItemcard({
    super.key,
    required this.index,
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
                "qwerty",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Best Price",
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
          Image.asset("assets/oni.png")
        ],
      ),
    );
  }
}
