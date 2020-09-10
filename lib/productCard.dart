import 'package:flutter/material.dart';

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
      // margin: EdgeInsets.symmetric(horizontal: 20)
      margin: EdgeInsets.fromLTRB(20, 0, 20, 25), //from only horizontal to tlrb
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all( Radius.circular(10) ),
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Colors.black.withOpacity(.16),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(image, height: 110,), //changed to 110
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
                      width: 150, //180 to 150
                      child: Text(product_name,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                    ),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Image.asset("assets/images/ruppee.png", height: 13,),
                        Text(" "+product_price,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                      ],
                    ),
                    SizedBox(height: 25,),
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
            height: 70, //from 80 to 70
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
          SizedBox(height: 12,),//from 20 to 12
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