import 'package:destock/CONSTANTS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class reply_quote_notification extends StatefulWidget {
  final String seller_name;
  final String time;
  final String product_name;
  final String product_image;
  final String seller_image;

  bool is_read;

  reply_quote_notification(
      {Key key,
      this.seller_name,
      this.product_name,
      this.product_image,
      this.seller_image,
      this.time,
      this.is_read});

//      : super(key: key);

  @override
  _reply_quote_notificationState createState() =>
      _reply_quote_notificationState();
}

class _reply_quote_notificationState extends State<reply_quote_notification> {
  String color = "assets/images/yellow_notification.png";

  @override
  void initState() {
    super.initState();

    if (widget.is_read) {
      print(color);
//      setState(() {
      color = "assets/images/grey_notification.png";
//      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.5, color: const Color(0xFFD7D7D7)))),
      height: 140,
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(color),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image.network(
                        //   localhostAddress + widget.seller_image,
                        //   height: 50,
                        // ),
                        Image.asset("assets/images/product_3.png", height: 50,),
                        Container(
                          width: 180,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: widget.seller_name,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' has replied to your quote for the following product',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 220,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5, color: const Color(0xFFD7D7D7)),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 160,
                            child: Text(
                              widget.product_name,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff6f6f6f)),
                            ),
                          ),
                          // Image.network(
                          //   localhostAddress+widget.product_image,
                          //   height: 30,
                          // ),
                          Image.asset("assets/images/product_2.png", height: 30,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.time + " ago",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff4B69FF)),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Color(0xffFC0151),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "VIEW",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
