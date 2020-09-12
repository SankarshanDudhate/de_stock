import 'package:flutter/material.dart';

class producd_card_suggest extends StatelessWidget {
  final String description;
  final String product_name;
  final String product_price;

  final String image;
  const product_card_suggest({Key key, this.description,this.product_name,this.product_price,this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),

      child: Row(
        children: [
          Image.asset(image, height: 110,),
          Container(
            width: 180,
            padding: const EdgeInsets.only(left:10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      child: Text(product_name,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.black),),
                    ),

                    Text("View",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff4DA4D6)),),
                  ],
                ),
                SizedBox(height: 10,),
                Text("Price ₹ "+product_price,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),

                SizedBox(height: 10,),

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