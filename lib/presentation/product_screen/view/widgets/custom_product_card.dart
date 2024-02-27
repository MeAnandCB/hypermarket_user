import 'package:flutter/material.dart';
import 'package:hypermarket_user/core/database/db_data.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({
    super.key,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Image.network(
                  DbData.myItems[0]["items"][0]["image"],
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Text(DbData.myItems[0]["items"][0]["name"]),
            Text(
              "Price :${DbData.myItems[0]["items"][0]["price"]}",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
