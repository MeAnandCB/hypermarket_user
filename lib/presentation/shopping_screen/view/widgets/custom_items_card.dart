import 'package:flutter/material.dart';
import 'package:hypermarket_user/core/database/db_data.dart';
import 'package:hypermarket_user/presentation/product_screen/view/product_List_screen.dart';

class CustomProductCard extends StatelessWidget {
  final int myindex;
  const CustomProductCard({
    super.key,
    required this.myindex,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: DbData.myItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          mainAxisExtent: 170),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductListScreen(),
            ),
          );
        },
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
      ),
    );
  }
}
