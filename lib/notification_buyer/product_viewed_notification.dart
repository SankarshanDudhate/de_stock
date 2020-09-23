import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class product_viewed extends StatefulWidget {
  final String views;
  final String product_name;
  final String product_image;
  bool is_read;

  product_viewed({Key key,this.product_name,this.product_image,this.views,this.is_read});
//      : super(key: key);

  @override
  _product_viewedState createState() => _product_viewedState();
}

class _product_viewedState extends State<product_viewed> {

  String color = "assets/images/blue_notification.png" ;
  @override
  void initState() {
    // TODO: implement initState
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
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  child: RichText(
                    text: TextSpan(


                        children: [
                          TextSpan(
                            text: widget.views + " PEOPLE",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,),
                          ),
                          TextSpan(
                            text: ' viewed the product which you saved earlier',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,),
                          ),



                        ]),
                  ),
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