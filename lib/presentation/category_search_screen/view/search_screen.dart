import 'package:flutter/material.dart';
import 'package:hypermarket_user/app_config/app_config.dart';
import 'package:hypermarket_user/core/constants/color.dart';
import 'package:hypermarket_user/presentation/product_screen/view/product_List_screen.dart';
import 'package:hypermarket_user/presentation/category_search_screen/controller/search_screen_controller.dart';

import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchdata = Provider.of<SearchScreenScreenController>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search Category',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<SearchScreenScreenController>(context,
                              listen: false)
                          .getsearchList(quary: searchController.text);
                    },
                    child: Container(
                      width: 100,
                      color: ColorConstant.primaryGreen,
                      child: Center(
                        child: Text(
                          "Search",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: searchdata.searchData.length,
                itemBuilder: (context, index) {
                  String searchImage = searchdata.searchData[index].image ?? "";
                  print(searchdata.searchData[index].name);
                  return searchdata.isSearchLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductListScreen(
                                  produtid: searchdata.searchData[index].id
                                      .toString(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    AppConfig.mediaUrl + searchImage),
                              ),
                              title:
                                  Text(searchdata.searchData[index].name ?? ""),

                              // You can display more information from the search results here
                            ),
                          ),
                        );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
