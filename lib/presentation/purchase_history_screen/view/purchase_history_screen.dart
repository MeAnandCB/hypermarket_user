import 'package:flutter/material.dart';

import 'package:hypermarket_user/presentation/purchase_history_screen/controller/purcharse_history_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  const PurchaseHistoryScreen({super.key});

  @override
  State<PurchaseHistoryScreen> createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<HistoryScreenController>(context, listen: false)
          .getHistoryList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<HistoryScreenController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history),
            SizedBox(
              width: 10,
            ),
            Text("History"),
          ],
        ),
        centerTitle: true,
      ),
      body: history.purchaseHistory.length < 0
          ? Center(
              child: Text("No History Available"),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: ListTile(
                      title: Text(
                        history.purchaseHistory[index].product ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "total Amount : ${history.purchaseHistory[index].totalAmount}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Qty :  ${history.purchaseHistory[index].quantity}"),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Date: ${_formatDate("${history.purchaseHistory[index].orderDate}")}",
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: history.purchaseHistory.length),
    );
  }

  String _formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString); // Parse the date string
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(dateTime); // Format the date
    return formattedDate;
  }
}
