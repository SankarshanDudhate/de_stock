import 'dart:convert';

import 'package:destock/SignupScreen1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'validatons.dart';
import 'otpscreen.dart';

class getstarted extends StatefulWidget {
  getstarted({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _getstartedState createState() => _getstartedState();
}

class _getstartedState extends State<getstarted> {
  final nameController = new TextEditingController();
  final emailController = new TextEditingController();
  final phoneNoController = new TextEditingController();

  void validateData() {
    //bool flag = true;
    String name = nameController.text;
    String email = emailController.text.toLowerCase();
    String phoneNo = phoneNoController.text;

    bool isNameValid = validateName(name);
    if( !isNameValid ) {
      Get.snackbar(
          "Invalid details", "Please enter a valid name"
      );
      return;
    }

    bool isEmailValid = validateEmail(email);
    if( !isEmailValid ) {
      Get.snackbar(
          "Invalid details", "Please enter a valid email address"
      );
      return;
    }

    bool isPhoneNoValid = validatePhoneNo(phoneNo);
    if( !isPhoneNoValid ) {
      Get.snackbar(
          "Invalid details", "Please enter a valid phone number"
      );
      return;
    }

    toOTPScreen();
  }

  void toOTPScreen() async {
    //print(nameController.text+","+emailController.text+","+phoneNoController.text);

    //send the resp date to otpscreen through shared preferences
    Map<String,String> dataMap = {
      "name":nameController.text,
      "email_id":emailController.text,
      "phone_no":phoneNoController.text
    };
    String dataString = jsonEncode(dataMap);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("userData", dataString);

    Navigator.of(context).push(
      new MaterialPageRoute(builder: (BuildContext context) {
        return OtpPage(signup: true);
        //return Signup(); //use this if you wanna skip otp
      })
    );
  }

  Widget _logobutton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only( top: 10),
              child: Image.asset("assets/images/destock_logo.png"),
              width:100,
              height: 60,
            ),
          ]
        ),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle( fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // offset: Offset(0, 1),
                    blurRadius: 2,
                    color: Colors.black.withOpacity(.08),
                  ),
                ],
              ),
            child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: Color(0xffffffff),
                    filled: true)),
          )
        ],
      ),
    );
  }

  Widget textEdit() {
    return Column(children: <Widget>[
      _entryField("Enter full name", nameController),
      _entryField("Enter email ID", emailController),
      _entryField("Enter phone number", phoneNoController),
    ]);
  }

  Widget _submitButton() {
    return Container(
      height: 100,
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: GestureDetector(
        onTap: validateData,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xffFC0151),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                alignment: Alignment.center,
                child: Text('REQUEST OTP',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        /*text: '',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),*/
          children: [
            TextSpan(
              text: "Let's get started" ,
              style: GoogleFonts.portLligatSans(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color(0xfff3f3f3),
                ),
                child:Stack(
                  children: <Widget>[
                    Positioned(
                      top:150,
                      left: -MediaQuery.of(context).size.width * .1,
                      child: SvgPicture.asset("assets/icons/bg_circle_grey.svg"), width: 150, height: 150,),
                    Positioned(
                      top:250,
                      right: -MediaQuery.of(context).size.width * .2,
                      child: SvgPicture.asset("assets/icons/bg_circle_stroke.svg"), width: 350, height: 350,),
                    Positioned(
                      top:500,
                      right: -MediaQuery.of(context).size.width * .15,
                      child: SvgPicture.asset("assets/icons/bg_circle.svg"), width: 250, height: 250,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Expanded(
                          //   flex: 2,
                          //   child: SizedBox(),
                          // ),
                          SizedBox(height: 150,),
                          _title(),
                          SizedBox(
                            height: 40,
                          ),
                          textEdit(),
                          SizedBox(height: 10,),
                          _submitButton(),
                          Expanded(
                            flex: 2,
                            child: SizedBox(),
                          )
                        ],
                      ),
                    ),
                    Positioned(top: 10, left: 10, child: _logobutton()),
                  ],
                ),
              ),
            )
        )
    );
  }
}