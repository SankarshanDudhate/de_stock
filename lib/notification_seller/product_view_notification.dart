import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class product_view extends StatefulWidget {
  final String views;
  final String product_name;
  final String product_image;
  bool is_read;

  product_view({Key key,this.product_name,this.product_image,this.views,this.is_read});
//      : super(key: key);

  @override
  _product_viewState createState() => _product_viewState();
}

class _product_viewState extends State<product_view> {

  String color = "assets/images/blue_notification.png" ;
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
            width: 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Your product was viewed ",
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black),),
                    Container(
                      height: 16,
                      width: 40,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all( Radius.circular(5) ),
                          color: Colors.black.withOpacity(0.6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                            size: 10,
                          ),
                          SizedBox(width: 2,),
                          Text(
                            widget.views,
                            style: TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Text(" times.",
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black),),
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
                      Image.asset(widget.product_image,height: 30,),
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