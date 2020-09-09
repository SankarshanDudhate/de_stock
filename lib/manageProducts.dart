import 'package:flutter/material.dart';

class manageProducts extends StatefulWidget {
  @override
  _manageProductsState createState() => _manageProductsState();
}

class _manageProductsState extends State<manageProducts> {

  String searchName;
  int activeCount = 2;
  int inactiveCount = 3;
  bool productStatus;

  Widget searchBox(){
    return Container(
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
      child: TextField(
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
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
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
                ))),
                SizedBox(width:30),
              Flexible(child: Container(
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
                ))),
            ],
          ),
        ),
        SizedBox(height:30),
        product_card(
                        product_id: "#786GFHDR",
                        product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                        product_price: "7000",
                        views: "112",
                        favorite: "19",
                        enquiries: "45",
                        expiry_date: "12 August 2020",
                        image: "assets/images/product image.png",
                      ),
        ]),
    );
  }
}



class product_card extends StatelessWidget {
  final String product_id;
  final String product_name;
  final String product_price;
  final String expiry_date;
  final String image;
  final String views;
  final String favorite;
  final String enquiries;
  const product_card({Key key, this.product_id,this.product_name,this.product_price,this.expiry_date, this.views,this.favorite, this.enquiries,this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20),),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 40,
              color: Colors.black.withOpacity(.16),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(image, height: 100,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product_id,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff6e6e6e)),),
                      SizedBox(height: 3,),
                      Container(
                       width: 190,
                        child: Text(product_name,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Image.asset("assets/images/ruppee.png", height: 13,),
                          Text(" "+product_price,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 15,
                        child: Row(
                          children: [
                            Text("EDIT",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                            VerticalDivider(color: Colors.black,),
                            Text("CHANGE QTY",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10),),
                color: Color(0xff0B868A),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.remove_red_eye,color: Colors.white,),
                      Text(views+" views",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite,color: Colors.white,),
                      Text(favorite+" times",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(enquiries,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
                      Text("Enquiries",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                Text("Ad expires on "+ expiry_date,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                Text("Renew Now",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff4DA4D6)),),
              ],
            ),

          ],
        ),
    );
  }
}