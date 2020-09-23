import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class out_of_stock extends StatefulWidget {

  final String product_name;
  final String product_image;
  bool is_read;

   out_of_stock({Key key,this.product_name,this.product_image,this.is_read});
//      : super(key: key);

  @override
  _out_of_stockState createState() => _out_of_stockState();
}

class _out_of_stockState extends State<out_of_stock> {

  String color = "assets/images/red_notification.png" ;
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(color),
          SizedBox(width: 10,),
          Container(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("OUT OF STOCK!",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xffD84764)),),
                Text("Your saved item has gone out of stock.",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xff000000)),),
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
          Text("VIEW SIMILAR",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xffD84764)),),
        ],
      ),
    );
  }
}