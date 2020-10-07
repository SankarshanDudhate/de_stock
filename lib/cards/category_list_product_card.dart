import 'package:flutter/material.dart';

class category_list_product_card extends StatelessWidget {
  final String description;
  final String product_name;
  final String product_price;
  final String image;
  final String views;

  const category_list_product_card({Key key, this.description,this.product_name,this.product_price,this.image,this.views })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all( Radius.circular(10) ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Color(0xffe5e5e5).withOpacity(1),
          ),
        ],

      ),

      child: Row(
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all( Radius.circular(5) ),
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 20,
                    width: 50,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all( Radius.circular(5) ),
                        color: Colors.black.withOpacity(0.6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 16,
                        ),
                        Text(
                          views,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 190,
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