import 'dart:convert';
import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'productCard.dart';

class manageProducts extends StatefulWidget {
  @override
  _manageProductsState createState() => _manageProductsState();
}

class _manageProductsState extends State<manageProducts> {
  Key listKey = new Key("productListKey");
  String searchName;
  int activeCount = 2;
  int inactiveCount = 3;
  bool productStatus;
  TextEditingController searchController = new TextEditingController();
  List activeProdList = new List();
  List inactiveProdList = new List();
  bool loadActiveProds = true;

  @override
  void initState() {
    super.initState();
  }

  Future<List<dynamic>> fetchProducts(bool activeProds) async {
    log("Active: "+activeProds.toString());
    String url = 'http://192.168.43.167:5000/products/';

    if(activeProdList.isEmpty && inactiveProdList.isEmpty) {
      //Only fetch data if it hasn't been fetched before
      var resp = await http.get(url);
      var productsList = jsonDecode(resp.body);
      print(productsList[0]);
      for(var prod in productsList ) {
        //print(prod["available"]);
        if(prod["available"]) {
          activeProdList.add(prod);
        } else {
          inactiveProdList.add(prod);
        }
      }
    }

    if(activeProds) log( activeProdList[0].toString() );
    else log(inactiveProdList[0].toString());
    activeCount = activeProdList.length;
    inactiveCount = inactiveProdList.length;
    if(activeProds) return activeProdList;
    else return inactiveProdList;
  }

  Widget productCardsColumn(bool activeProds) {
    //print('anfksnkja');
    return FutureBuilder(
        future: fetchProducts(activeProds),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          //print(snapshot.data);
          List prods = snapshot.data.toList();
          //print(prods);
          return Column(
            children: prods.map((prod) => productCard(prod)).toList(),
          );
        }
    );
  }
  
  Widget productCard(cardData) {
    return product_card(
      product_id: "#786GFHDR", //need to add product number
      product_name: cardData["name"],
      product_price: cardData["price"].toString(),
      views: cardData["views"].toString(),
      favorite: cardData["wishlisted"].toString(),
      enquiries: cardData["enquiries"].toString(),
      expiry_date: cardData["expiryDate"].toString(),
      image: "assets/images/product image.png", //change image
    );
  }

  void showInactiveProucts() {
    //return productCardsColumn(false);
  }

  Widget searchBox() {
    return Container(
      //height: double.infinity,
      //padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30),),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 40,
              color: Colors.black.withOpacity(.16),
            ),
          ],
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: Colors.grey,
          hintText: "Search for product name or code",
          hintStyle: TextStyle(
          color: Colors.grey[400]
        ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.grey),
                //color:Colors.grey,
              ),
          suffixIcon: Icon(Icons.search,color: Colors.black87,),
        ),
        controller: searchController,
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Stack(
                  children:[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0)),
                      ),
                      //margin: EdgeInsets.fromLTRB(20,0,50,0),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios), onPressed: (){
                            setState(() {
                              //Navigate
                            });
                          }),
                          //SizedBox(width: 50,),
                          Column(
                            children: [
                              Text("Manage your products", style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          Column(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 75, 40, 0),
                      child: searchBox(),
                    )
                  ]
              ),
              SizedBox(height: 30,),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                // print("dumb-fucking state!");
                                this.loadActiveProds = true;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black
                                      )
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Active Products",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                    SizedBox(width:5),
                                    Text("(3)",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                  ],
                                )),
                          )),
                      SizedBox(width:20),
                      Flexible(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                // print("dumb-fucking state!");
                                this.loadActiveProds = false;
                              });
                            },
                            child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black
                                  )
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Inactive Products",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                SizedBox(width:5),
                                Text("(3)",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                              ],
                            )),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height:30),
              productCardsColumn(this.loadActiveProds),
              // ListView.builder(itemBuilder: (context){
              //     return
              // })
            ]
        ),
      ),
    );
  }
}



