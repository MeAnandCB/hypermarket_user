import 'package:flutter/material.dart';
import 'package:hypermarket_user/app_config/app_config.dart';
import 'package:hypermarket_user/core/database/db_data.dart';

class CustomItemCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const CustomItemCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });
//  images urls list

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Image.network(
                    AppConfig.mediaUrl + image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Text(
                name.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Price :${price}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
