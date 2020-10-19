import 'dart:convert';
import 'dart:developer';

import 'package:destock/CONSTANTS.dart';
import 'package:destock/models/Product.dart';
import 'package:destock/search_product_card_big.dart';
import 'package:destock/search_product_card_small.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SearchHome extends StatefulWidget {
  SearchHome({this.searchText});
  String searchText;

  @override
  _SearchHomeState createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  TextEditingController _searchController;

  // List<Product> productList = new List();
  List<Product> productList = [];
  // [new Product.fromJson({
  //   "available": true,
  //   "categoryId": 1,
  //   "details": "Some random stuff that decribes the product... But keep it short, don't get carried away!",
  //   "id": 1,
  //   "location": "Pune, Maharashtra - 411057",
  //   "minQty": 300,
  //   "name": "Cast Iron gears 15 inch 1050 rounded edges- PVC",
  //   "price": 7000,
  //   "priceDisclose": true,
  //   "soldCount": 1000,
  //   "specifications": 'json["specifications"]',
  //   "subCategoryId": 1,
  //   "unit": "kg",
  //   "views": 100,
  // })];
  List search = new List();
  List productJsonList = new List(); //needed because product class doesnt have image and category attributes

  FocusNode _focus = FocusNode();

  @override
  void initState() {
    String initialText = (widget.searchText == null) ? '' : widget.searchText;
    _searchController = new TextEditingController(text: initialText);
    log("Received: "+initialText+", "+widget.searchText.toString());

    // productList.add(new Product.fromJson({
    //   "available": true,
    //   "categoryId": 1,
    //   "details": "Some random stuff that decribes the product... But keep it short, don't get carried away!",
    //   "id": 1,
    //   "location": "Pune, Maharashtra - 411057",
    //   "minQty": 300,
    //   "name": "Cast Iron gears 15 inch 1050 rounded edges- PVC",
    //   "price": 7000,
    //   "priceDisclose": true,
    //   "soldCount": 1000,
    //   "specifications": 'json["specifications"]',
    //   "subCategoryId": 1,
    //   "unit": "kg",
    //   "views": 100,
    // }));
  }

  @override
  Widget build(BuildContext context) {
    _focus.addListener(() {
      debugPrint("Focus: " + _focus.hasFocus.toString());
      (_focus.hasFocus)
          ? FocusScope.of(context).requestFocus(_focus)
          : FocusScope.of(context).unfocus();
    });

    return Scaffold(
      body: Stack(children: [
        Container(
          height: 180,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xffD84764),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(80)),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Suggested for you",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 24),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            margin: EdgeInsets.only(top: 200),
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ProductSearchCard(
                      productName: productList[index].name,
                      productPrice: productList[index].price.toString(),
                      views: productList[index].views.toString(),
                      image: productJsonList[index]['image'],
                      description: productList[index].details,
                      category: productJsonList[index]['category'],
                    ),
                    SizedBox(height: 15,),
                  ]
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 140,
          right: 60,
          child: Column(
            children: [
              Container(
                width: 320,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 5,
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.4),
                    )
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  focusNode: _focus,
                  style: TextStyle(fontSize: 21),
                  textAlignVertical: TextAlignVertical.top,
                  onChanged: (v) {
                    post(localhostAddress+'/products/keywordSuggestion/',
                        body: {'keyword': v}).then((value) {
                      print(v);
                      print(jsonDecode(value.body));
                      setState(() {
                        search = jsonDecode(value.body);
                      });
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only( top: 5),
                      child: SizedBox(height: 3, child: Icon(Icons.search)),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _focus.unfocus(disposition: UnfocusDisposition.scope);
                          // print(_focus.hasFocus);
                          // print(_focus.hasPrimaryFocus);
                        }),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24))),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ),
              (_focus.hasFocus)
                  ? Container(
                      height: 300,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(24)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 7,
                              spreadRadius: 5,
                              color: Colors.grey.withOpacity(0.4),
                            )
                          ]),
                      child: ListView.builder(
                        itemCount: search.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {
                              post(localhostAddress+'/products/search/0/',
                                      body: {'search': search[index]})
                                  .then((value) {
                                    log(value.body);
                                setState(() {
                                  productList = productFromJson(value.body);
                                  productJsonList = jsonDecode(value.body);
                                });
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              });
                            },
                            title: Text(search[index]),
                          );
                        },
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ]),
    );
  }
}
