import 'dart:io';

import 'package:destock/PostAnAd/confirmDelete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class renewalBilling extends StatefulWidget {
  @override
  _renewalBillingState createState() => _renewalBillingState();
}

class _renewalBillingState extends State<renewalBilling> {

  int renewStatus = 3;
  String image = 'assets/images/IMG1.png';
  String productId = "#A4RF6789";
  String expiryDate = "August 19, 2020";
  String startDate = "May 20, 2020";
  String endDate = "May 27, 2020";

  Widget _buildRenewCard(renewStatus){
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20,vertical:20),
      margin: EdgeInsets.symmetric(horizontal:10,vertical:10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFFFFFFF),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset(image, height: 100,),),
          SizedBox(width:10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productId, style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
              SizedBox(height:20),
              renewStatus == 0 ? RichText(text: TextSpan(
                text: "Auto-renewal on\n",
                style: TextStyle(color: Color(0xFF000000),fontSize: 14),
                children: <TextSpan>[
                  TextSpan(text: expiryDate, style: TextStyle(fontSize: 20,color: Color(0xFF6F6F6F))),
                ],
                )
                )
                : renewStatus == 1 ? RichText(text: TextSpan(
                text: "Ad expires on\n",
                style: TextStyle(color: Color(0xFF000000),fontSize: 14),
                children: <TextSpan>[
                  TextSpan(text: expiryDate, style: TextStyle(fontSize: 20,color: Color(0xFF6F6F6F))),
                ],
                )
                )
                : RichText(text: TextSpan(
                text: "AD DURATION\n\n",
                style: TextStyle(color: Color(0xFF626161),fontSize: 10, backgroundColor: Color(0xFFF9E3E8)),
                children: <TextSpan>[
                  TextSpan(text: startDate +"-"+ endDate, style: TextStyle(fontSize: 12,color: Color(0xFF6F6F6F),backgroundColor: Color(0xFFFFFFFF))),
                ],
                )
              )
            ],
          ),
          SizedBox(width:10),
          renewStatus == 0 ? Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                //color: Color(0xFF2DDDB7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: (){

                },
                child: Text("EDIT", style: TextStyle(fontSize:20,color: Color(0xFF2DDDB7),fontWeight: FontWeight.bold),)),
            ),
          ],
        )
        : renewStatus == 1 ? Column(
          children: [
            GestureDetector(
              onTap: (){

              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFF2DDDB7),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text("RENEW", style: TextStyle(fontSize:20,color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold),)),
            )
            ],
        )
        : Column(
          children: [
            GestureDetector(
              onTap: (){
                _buildDeleteDialogue(context);
              },
              child: SvgPicture.asset("assets/icons/trash.svg",height: 24,width: 16,)),
            SizedBox(height:20),
            GestureDetector(
              onTap: (){

              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFF2DDDB7),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text("RENEW", style: TextStyle(fontSize:20,color: Color(0xFFFFFFFF),fontWeight: FontWeight.bold),)),
            )
          ],
        )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset("assets/images/Group_166.png"),
              Column(
                children: [
                  SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_ios),
                        SizedBox(width: 20,),
                        SvgPicture.asset("assets/icons/money.svg",height: 40,width: 40,),
                        SizedBox(width: 20,),
                        Flexible(child: Text("Renewals and billings", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                      ],
                    ),
                  ),
                  SizedBox(height:80),
                  //Pass the 
                  _buildRenewCard(renewStatus),
                  ],)]))
    );
  }
}



void _buildDeleteDialogue(BuildContext context) {

   
    var alertDialog = AlertDialog(
      content : deleteDialog(),
      shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(5.0))
               ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
    );
  }
