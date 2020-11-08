import 'package:destock/utils/bg_clip_red.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class paymentSuccess extends StatefulWidget {
  @override
  _paymentSuccessState createState() => _paymentSuccessState();
}

class _paymentSuccessState extends State<paymentSuccess> {

  String productName = "Aluminium pipes- pvc-260 pieces";
  String productDetails = "A little brief about the product comes brief about...";
  String imageSrc = 'assets/images/IMG1.png';
  double noOfProducts = 1;

  Widget _buildProductRow(String imageSrc, String name, String details){
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset(imageSrc, fit: BoxFit.cover, width: 120,height: 120,)
          ),
          SizedBox(width:20),
          Flexible(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(details,style: TextStyle(fontSize: 16,color:Color(0xFFA5A5A5)),)),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Text("VIEW AD",style: TextStyle(fontSize: 16,color:Color(0xFF4B69FF),decoration: TextDecoration.underline,),)),
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:0,vertical:20),
        child: SingleChildScrollView(
          child: Column(
            children:[
              SizedBox(height:80),
              SvgPicture.asset("assets/icons/paymentSuccess.svg",height:100,width: 100),
              SizedBox(height:40),
              Text('Payment is successfully done!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height:40),
              GestureDetector(
                onTap: (){
                  //Navigate to dashboard
                },
                child: Text('GO TO DASHBOARD',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFFFC0151),),)
              ),
              SizedBox(height:50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: Row(
                  children: [
                    Text('Your products are live',style: TextStyle(fontSize: 16,color: Color(0xFF7B7878),),),
                  ],
                ),
              ),
              Stack(
                children: [
                  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: BgClip(
                          height: 240 * noOfProducts,
                        ),
                      ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal:10,vertical: 20),
                      margin: EdgeInsets.symmetric(horizontal:10,vertical:30),
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                          color: Color(0xFFFFF9FA),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 10,
                              color: Colors.black.withOpacity(.16),
                          ),]
                      ),
                      child: _buildProductRow(imageSrc,productName,productDetails),
                  ) 
                ],
              )
            ]
          ),
        )
      )
    );
  }
}