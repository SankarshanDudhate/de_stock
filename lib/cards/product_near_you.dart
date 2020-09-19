import 'package:flutter/material.dart';

class product_near_you extends StatelessWidget {
  final String distance;
  final String product_name;
  final String product_price;

  final String image;

  const product_near_you({Key key, this.distance,this.product_name,this.product_price,this.image})
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      width: 120,
                      child: Text(product_name,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.black),),
                    ),

            Icon(Icons.favorite_border,color: Colors.black,) ,
                  ],
                ),
                SizedBox(height: 10,),
                Text("Price ₹ "+product_price,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),

                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 30,
                      color: Colors.black,
                    ),
                    Container(
                      width: 120,
                      child: Text(distance + " km from your location",
                        style: TextStyle(fontSize: 9, fontWeight: FontWeight.w400, color: Colors.black),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}