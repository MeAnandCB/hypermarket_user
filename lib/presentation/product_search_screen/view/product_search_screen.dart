// import 'package:flutter/material.dart';
// import 'package:hypermarket_user/core/constants/color.dart';
// import 'package:hypermarket_user/presentation/cart_screen/view/cart_screen.dart';
// import 'package:hypermarket_user/presentation/category_search_screen/controller/search_screen_controller.dart';
// import 'package:hypermarket_user/presentation/product_screen/controller/product_screen_controller.dart';
// import 'package:provider/provider.dart';

// class ProducSearchScreen extends StatefulWidget {
//   const ProducSearchScreen({super.key, required this.produtid});
//   final String produtid;

//   @override
//   State<ProducSearchScreen> createState() => _ProducSearchScreenState();
// }

// class _ProducSearchScreenState extends State<ProducSearchScreen> {
//   TextEditingController searchController = TextEditingController();

//   @override
//   void dispose() {
//     searchController.clear();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final searchdata = Provider.of<SearchScreenScreenController>(context);
//     return Scaffold(
//       backgroundColor: ColorConstant.primaryGreen,
//       body: Column(
//         children: [
//           SizedBox(
//             height: 30,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: SizedBox(
//               height: 60,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: CircleAvatar(
//                       child: Icon(
//                         Icons.arrow_back_ios_new,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     "Product List",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                         color: Colors.white),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CartScreen(),
//                         ),
//                       );
//                     },
//                     child: CircleAvatar(
//                       child: Icon(
//                         Icons.shopping_cart,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 60,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Search Category',
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Provider.of<SearchScreenScreenController>(context,
//                             listen: false)
//                         .getsearchList(quary: searchController.text);
//                   },
//                   child: Container(
//                     width: 100,
//                     color: ColorConstant.primaryGreen,
//                     child: Center(
//                       child: Text(
//                         "Search",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Expanded(
//             child: SizedBox(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.vertical(
//                       top: Radius.elliptical(
//                           MediaQuery.of(context).size.width, 100.0)),
//                   color: Colors.white,
//                 ),
//                 alignment: Alignment.bottomCenter,
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 child: Padding(
//                     padding: const EdgeInsets.only(top: 50),
//                     child: Center(child: CircularProgressIndicator())
//                     // : GridView.builder(
//                     //     itemCount: productProvider.productListnList.length,
//                     //     padding: EdgeInsets.symmetric(horizontal: 10),
//                     //     gridDelegate:
//                     //         SliverGridDelegateWithFixedCrossAxisCount(
//                     //             crossAxisCount: 2,
//                     //             mainAxisSpacing: 10,
//                     //             crossAxisSpacing: 10),
//                     //     itemBuilder: (context, index) => InkWell(
//                     //         onTap: () async {
//                     //           await Navigator.push(
//                     //               context,
//                     //               MaterialPageRoute(
//                     //                 builder: (context) =>
//                     //                     ProductDetailsScreen(
//                     //                   id: productProvider
//                     //                       .productListnList[index].id
//                     //                       .toString(),
//                     //                 ),
//                     //               ));
//                     //         },
//                     //         child: CustomItemCard(
//                     //           image: productProvider
//                     //                   .productListnList[index].image ??
//                     //               '',
//                     //           name: productProvider
//                     //                   .productListnList[index].name ??
//                     //               "",
//                     //           price: productProvider
//                     //               .productListnList[index].price
//                     //               .toString(),
//                     //         ))),
//                     // child: Column(
//                     //   children: [
//                     //     CustomMovieCards(
//                     //       height: 200,
//                     //       width: 200,
//                     //       title: "Preview",
//                     //       imagesList: DbData.movieImageUrls1,
//                     //     ),
//                     //   ],
//                     // )
//                     ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
