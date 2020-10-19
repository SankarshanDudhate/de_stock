import 'package:destock/CONSTANTS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class product_wishlisted extends StatefulWidget {

  final String wishlist_count;
  final String product_name;
  final String product_image;

  bool is_read;


  product_wishlisted({Key key,this.product_name,this.product_image,this.wishlist_count,this.is_read});
//      : super(key: key);

  @override
  _product_wishlistedState createState() => _product_wishlistedState();
}

class _product_wishlistedState extends State<product_wishlisted> {

  String color = "assets/images/red_notification.png" ;
  @override
  void initState() {
    super.initState();

    if(widget.is_read){
      print(color);
//      setState(() {
      color = "assets/images/grey_notification.png";
//      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5,color: const Color(0xFFD7D7D7)))),
      height: 140,
      padding: EdgeInsets.symmetric(vertical: 15),

      margin: EdgeInsets.symmetric(horizontal: 17),

      child: Row(
        children: [
          Image.asset(color),
          SizedBox(width: 10,),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Your product was wishlisted by ",
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black),),
                    Icon(
                      Icons.favorite,
                      color: Color(0xffFC0151),
                      size: 15,
                    ),
                    Text(" "+widget.wishlist_count +" PEOPLE",
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xffFC0151)),),
                  ],
                ),
                Container(
                  width: 220,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(border: Border.all(width: 0.5, color: const Color(0xFFD7D7D7)),
                    borderRadius: BorderRadius.all( Radius.circular(5),),),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 160,
                        child: Text(widget.product_name,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: Color(0xff6f6f6f)),),
                      ),
                      Image.network(localhostAddress+widget.product_image,height: 30,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}