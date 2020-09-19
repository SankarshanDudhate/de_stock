import 'package:flutter/material.dart';

class pro_card_hor_scroll extends StatelessWidget {
  final String product_name;
  final String product_price;
  final String image;

  const pro_card_hor_scroll({Key key, this.product_name,this.product_price,this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:140,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10),),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, height: 130,),
          Container(
            width: 130,
            child: Text(product_name,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.black),),
          ),
          SizedBox(height: 5,),
          Text("Price ₹ "+product_price,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xffA9A9A9)),),

          SizedBox(height: 10,),

        ],
      ),
    );
  }
}

class product_card_trending extends StatelessWidget {
  final String product_name;
  final String product_price;
  final String image;

  const product_card_trending({Key key, this.product_name,this.product_price,this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:160,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10),),
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
          Image.asset(image, height: 150,),
          Container(
            width: 150,
            child: Text(product_name,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.black),),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price ₹ "+product_price,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xffA5A5A5)),),
              Text("View",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.blue),),
            ],
          ),

          SizedBox(height: 10,),

        ],
      ),
    );
  }
}