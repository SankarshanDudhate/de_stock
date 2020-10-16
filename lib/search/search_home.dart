import 'dart:convert';

import 'package:destock/models/Product.dart';
import 'package:destock/search_product_card_big.dart';
import 'package:destock/search_product_card_small.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SearchHome extends StatefulWidget {
  @override
  _SearchHomeState createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  final _searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  List<Product> productList = new List();
  List search = new List();

  FocusNode _focus = FocusNode();

  _searchProduct(search) {
    post('http://192.168.43.188:5000/products/search/${productList.length}',
        body: {'search': search}).then((value) {
      setState(() {
        productList = productList + productFromJson(value.body);
      });
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _searchProduct(_searchController.value.text);
      }
    });
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
            margin: EdgeInsets.only(top: 180),
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductSearchCard(
                  productName: productList[index].name,
                  productPrice: productList[index].price.toString(),
                  views: productList[index].views.toString(),
                  image: 'assets/images/product_1.png',
                  description: productList[index].details,
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 160,
          right: 40,
          child: Column(
            children: [
              Container(
                width: 320,
                height: 50,
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
                  onChanged: (v) {
                    post('http://192.168.43.188:5000/products/',
                        body: {'keyword': v}).then((value) {
                      print(v);
                      print(jsonDecode(value.body));
                      setState(() {
                        search = jsonDecode(value.body);
                      });
                    });
                  },
                  decoration: InputDecoration(
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
                              _searchProduct(search[index]);
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
