import 'dart:convert';
import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool productStatus = true;
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
      productStatus: productStatus,
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30),),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 5,
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
          border: InputBorder.none,
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
                    Image.asset("assets/images/Group_167.png"),
                    Container(
                      //margin: EdgeInsets.fromLTRB(20,0,50,0),
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 50),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios), onPressed: (){
                            setState(() {
                              //Navigate
                            });
                          }),
                          SizedBox(width: 20,),
                          SvgPicture.asset("assets/icons/money.svg",height: 40,width: 40,),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Text("Manage your products", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 100, 40, 0),
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
                                this.productStatus = true;
                                this.loadActiveProds = true;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                decoration: productStatus == true ? BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xFF4B69FF)
                                      )
                                  ),
                                ): BoxDecoration(),
                                child:  RichText(
                                    text: TextSpan(
                                      text: 'Active Products ',
                                      style: TextStyle(color: productStatus == true ? Color(0xFF4B69FF) : Color(0xFF9A9B9B),fontSize: 16, fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(text: "(", style: TextStyle(fontSize: 12)),
                                        TextSpan(text: activeCount.toString(), style: TextStyle(fontSize: 12),),
                                        TextSpan(text: ")", style: TextStyle(fontSize: 12)),

                                      ],
                                    ),
                                  ),
                              ),
                          )),
                      SizedBox(width:20),
                      Flexible(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                this.productStatus = false;
                                this.loadActiveProds = false;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                decoration: productStatus == false ? BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xFF4B69FF)
                                      )
                                  ),
                                ): BoxDecoration(),
                                child:  RichText(
                                    text: TextSpan(
                                      text: 'Inactive Products ',
                                      style: TextStyle(color: productStatus == false ? Color(0xFF4B69FF) : Color(0xFF9A9B9B),fontSize: 16, fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(text: "(", style: TextStyle(fontSize: 12)),
                                        TextSpan(text: inactiveCount.toString(), style: TextStyle(fontSize: 12),),
                                        TextSpan(text: ")", style: TextStyle(fontSize: 12)),

                                      ],
                                    ),
                                  ),
                              ),
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



