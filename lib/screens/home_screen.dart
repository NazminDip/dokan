import 'package:dokan_clone/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'search_screen.dart';

class HomePage extends StatefulWidget {
  static String route = "HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBottomSheet = false;

  bool newest_check = false;
  bool oldest_check = false;
  bool price_low_to_high = false;
  bool price_high_to_low = false;
  bool best_selling = false;

  int _selectedIndex = 0;
  List cart = List.of(<CartItem>{});
  List itemImage = List.of(<AssetImage>{});
  List coverImage = List.of(<AssetImage>{});
  List itemCurrPrice = List.of(<double>{});
  List itemDiscPrice = List.of(<double>{});
  List itemLabel = List.of(<String>{});
  List itemRating = List.of(<String>{});

  void addToCart(CartItem item) {
    setState(() {
      cart.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    itemImage.add(const AssetImage("assets/images/product1.png"));
    itemImage.add(const AssetImage("assets/images/product2.png"));
    itemImage.add(const AssetImage("assets/images/product3.png"));
    itemImage.add(const AssetImage("assets/images/product4.png"));
    itemImage.add(const AssetImage("assets/images/product5.png"));
    itemImage.add(const AssetImage("assets/images/product6.png"));

    // coverImage.add(AssetImage("assets/images/cover3.jpeg"));
    // coverImage.add(AssetImage("assets/images/cover2.jpg"));
    // coverImage.add(AssetImage("assets/images/cover1.jpg"));
    // coverImage.add(AssetImage("assets/images/9gaglogo.png"));
    // coverImage.add(AssetImage("assets/images/vancityryanreynoldslogo.jpg"));

    itemLabel.add("Girlish Stylish Dresses");
    itemLabel.add("Man Stylish Dresses");
    itemLabel.add("Man Stylish Dresses");
    itemLabel.add("Girlish Stylish Dresses");
    itemLabel.add("Man Stylish Dresses");
    itemLabel.add("Girlish Stylish Dresses");

    itemCurrPrice.add(200.0);
    itemCurrPrice.add(450.0);
    itemCurrPrice.add(190.0);
    itemCurrPrice.add(1200.0);
    itemCurrPrice.add(900.0);
    itemCurrPrice.add(900.0);

    itemDiscPrice.add(190.0);
    itemDiscPrice.add(420.0);
    itemDiscPrice.add(180.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(200.0);

    itemRating.add("\*4.2");
    itemRating.add("\*4.5");
    itemRating.add("\*4.5");
    itemRating.add("\*4.7");
    itemRating.add("\*2.5");
    itemRating.add("\*2.5");
    int length = (itemLabel.length * .5).toInt();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Product List",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const Icon(Icons.search),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Filter",
                  prefix: InkWell(
                    onTap: () {
                      setState(() {
                        _showBottomSheet = true;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: FaIcon(FontAwesomeIcons.slidersH, size: 15),
                    ),
                  ),
                  border: InputBorder.none,
                  suffix: Container(
                    width: 100,
                    child: Row(
                      children: [
                        Text("Sort By"),
                        Icon(Icons.arrow_drop_down),
                        Icon(Icons.menu),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(itemLabel.length, (index) {
                  return Column(
                    children: [
                      Container(
                        height: 140,
                        width: 190,
                        margin: EdgeInsets.only(left: 20, right: 30),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: itemImage[index],
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                      ),
                      Container(
                        width: 150,
                        child: Text(itemLabel[index].toString()),
                      ),
                      Container(
                        // padding: EdgeInsets.only(top:10),
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(itemDiscPrice[index].toString(),
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.red.shade600,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Container(
                              child: Text(itemCurrPrice[index].toString(),
                                  style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          itemRating[index],
                          textAlign: TextAlign.end,
                        ),
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(left: 20, right: 30),
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                      )

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       child:
                      //       Text(itemDiscPrice[index].toString() ,
                      //           style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.red.shade600,fontWeight: FontWeight.w700)
                      //       ),
                      //     ),
                      //     Container(child: Text(itemCurrPrice[index].toString() ,
                      //         style: TextStyle(color: Colors.blue.shade600,fontWeight: FontWeight.w700)
                      //     ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      // bottomSheet:
      // _showBottomSheet
      //     ? BottomSheet(
      //
      //   builder: (BuildContext context) {
      //
      //   return Container(
      //       height:400,
      //       child:Column(
      //     children: [
      //       Container(
      //         alignment: Alignment.topCenter,
      //           width: 150,
      //           margin: EdgeInsets.only(left:20,right:20,top:10),
      //           child: Divider(
      //             height: 5,
      //             color: Colors.deepOrange,
      //           ),
      //       ),
      //       Container(
      //           margin: EdgeInsets.all(20),
      //           child: Text("Filter")
      //       ),
      //       Row(
      //         children: [
      //
      //           Checkbox( onChanged: (value){
      //             newest_check=value!;
      //           }, value: false),
      //
      //           Text("Newest"),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //
      //           Checkbox( onChanged: (value){
      //             oldest_check=value!;
      //           }, value: false),
      //
      //           Text("Oldest"),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //
      //           Checkbox( onChanged: (value){
      //             price_high_to_low=value!;
      //           }, value: false),
      //
      //           Text("Price high>Low"),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //
      //           Checkbox( onChanged: (value){
      //             price_low_to_high=value!;
      //           }, value: false),
      //
      //           Text("Price low>High"),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //
      //           Checkbox( onChanged: (value){
      //             newest_check=value!;
      //           }, value: false),
      //
      //           Text("Newest"),
      //         ],
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             ElevatedButton(
      //               child: const Text(
      //                 'Cancel',
      //                 style: TextStyle(color: Colors.white),
      //               ),
      //               onPressed: () {
      //                 setState(() {
      //                   _showBottomSheet = false;
      //                 });
      //               },
      //             ),
      //             ElevatedButton(
      //               child: const Text(
      //                 'Apply',
      //                 style: TextStyle(color: Colors.white),
      //               ),
      //               onPressed: () {
      //                 setState(() {
      //                   _showBottomSheet = false;
      //                 });
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //
      //
      //
      //     ],
      //   )
      //   );
      // }, onClosing: () {
      //     print("closed");
      // },
      //
      // ):null,
    );
  }
}
