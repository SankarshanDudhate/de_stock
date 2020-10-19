import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ad_expire extends StatefulWidget {
  final String days_left;
  final String product_name;
  final String product_image;
  bool is_read;

  ad_expire({Key key,this.product_name,this.product_image,this.days_left,this.is_read});
//      : super(key: key);

  @override
  _ad_expireState createState() => _ad_expireState();
}

class _ad_expireState extends State<ad_expire> {

  String color = "assets/images/cyan_notification.png" ;
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

      decoration: BoxDecoration(

      border: Border(bottom: BorderSide(width: 0.5,color: const Color(0xFFD7D7D7)))),
      height: 140,
      padding: EdgeInsets.symmetric(vertical: 15),

      margin: EdgeInsets.symmetric(horizontal: 17),

      child: Row(
        children: [
          Image.asset(color),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(widget.product_image,height: 50,),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("HURRY!",
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xff2DDDB7)),),
                      SizedBox(height: 5,),
                      Container(

                        width: 250,
                        child: RichText(
                          text: TextSpan(


                              children: [
                                TextSpan(
                                  text:  "Your ad for " ,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,),
                                ),
                                TextSpan(
                                  text: widget.product_name,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,),
                                ),
                                TextSpan(
                                  text: " is expiring soon." ,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,),
                                ),


                              ]),
                        ),
                      ),
                    ],
                  ),



                ],
              ),
              Container(
                width: 320,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("DAYS LEFT",
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xffa6a6a6)),),
                        SizedBox(width: 10,),
                        Text(widget.days_left +" days",
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.black),),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      decoration: BoxDecoration(color: Color(0xff2DDDB7),
                          borderRadius: BorderRadius.all( Radius.circular(10) )),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "RENEW NOW",
                          style: TextStyle(fontSize: 12.0,color: Colors.white,fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}