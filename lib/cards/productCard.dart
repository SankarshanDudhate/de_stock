import 'package:flutter/material.dart';

class product_card extends StatelessWidget {

  final String product_id;
  final String product_name;
  final String product_price;
  final String expiry_date;
  final String image;
  final String views;
  final String favorite;
  final String enquiries;
  final bool productStatus;
  const product_card({Key key, this.productStatus, this.product_id,this.product_name,this.product_price,this.expiry_date, this.views,this.favorite, this.enquiries,this.image="assets/images/product image.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20)
      margin: EdgeInsets.fromLTRB(20, 0, 20, 25), //from only horizontal to tlrb
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all( Radius.circular(10) ),
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 40,
            color: Color(0xffe5e5e5).withOpacity(1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(image, height: 120,), //changed to 110
              Container(
                height: 120,
                padding: const EdgeInsets.fromLTRB(10,0,0,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product_id,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff6e6e6e)),),

                    Container(
                      width: 180,
                      child: Text(product_name,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),),
                    ),

                    Row(
                      children: [
                        Text("₹"+product_price,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                      ],
                    ),
                    SizedBox(height: 25,),
                    Container(
                      height: 15,
                      child: Row(
                        children: [
                          Text("EDIT",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                          VerticalDivider(color: Colors.black,),
                          Text("CHANGE QTY",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 70, //from 80 to 70
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10),),
              color: productStatus == true ? Color(0xFF0B868A) : Color(0xFFC4C4C4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove_red_eye,color: Colors.white,),
                    Text(views+" views",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite,color: Colors.white,),
                    Text(favorite+" times",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(enquiries,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
                    Text("Enquiries",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12,),//from 20 to 12
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              Text("Ad expires on "+ expiry_date,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
              Text("Renew Now",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff4DA4D6)),),
            ],
          ),
        ],
      ),
    );
  }
}


/*class product_card extends StatelessWidget {
  final String product_id;
  final String product_name;
  final String product_price;
  final String expiry_date;
  final String image;
  final String views;
  final String favorite;
  final String enquiries;
  const product_card({Key key, this.product_id,this.product_name,this.product_price,this.expiry_date, this.views,this.favorite, this.enquiries,this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20),),
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 40,
            color: Color(0xffe5e5e5).withOpacity(1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(image, height: 120,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product_id,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff6e6e6e)),),

                    Container(
                      width: 180,
                      child: Text(product_name,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),),
                    ),


                    Text("₹ "+product_price,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                    SizedBox(height: 10,),
                    Container(
                      height: 15,
                      child: Row(
                        children: [
                          Text("EDIT",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                          VerticalDivider(color: Colors.black,),
                          Text("CHANGE QTY",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10),),
              color: Color(0xff0B868A),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove_red_eye,color: Colors.white,),
                    Text(views+" views",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite,color: Colors.white,),
                    Text(favorite+" times",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(enquiries,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
                    Text("Enquiries",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              Text("Ad expires on "+ expiry_date,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
              Text("Renew Now",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff4DA4D6)),),
            ],
          ),

        ],
      ),
    );
  }
}*/