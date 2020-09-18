import 'package:flutter/material.dart';
import 'package:destock/cards/search_product_card_small.dart';


class product_card_suggest_withtag extends StatelessWidget {
  final String description;
  final String product_name;
  final String product_price;

  final String image;

  const product_card_suggest_withtag({Key key, this.description,this.product_name,this.product_price,this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
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

      child: Row(
        children: [
          Image.asset(image, height: 110,),
          Container(
            width: 200,
            padding: const EdgeInsets.only(left:10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140,
                      child: Text(product_name,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.black),),
                    ),

                    Icon(Icons.favorite_border,color: Colors.black,) ,
                  ],
                ),
                SizedBox(height: 7,),
                Text("Price ₹ "+product_price,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),

                SizedBox(height: 7),

                Container(
                  width: 50,
                  height:20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all( Radius.circular(3) ),
                    color: Color(0xffD84764).withOpacity(.15),

                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Gearbox",
                      style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                  ),
                ),

                SizedBox(height: 7),

                Container(
                  width: 180,
                  child: Text(description,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff6F6F6F)),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}