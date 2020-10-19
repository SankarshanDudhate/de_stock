import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'otpscreen.dart';
import 'package:destock/SignupScreen1.dart';

class OtpPage extends StatefulWidget {
  //OtpPage({Key key, this.title}) : super(key: key);
  //final String title;
  bool signup;
  bool login;
  OtpPage({bool this.signup=false, bool this.login=false});
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final otpController = new TextEditingController();
  String sessionId;
  @override
  void initState() {
    super.initState();
    sendOTP();
  }

  void sendOTP() async {
      // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      // String data = await sharedPreferences.getString("userData");
      // var dataJson = jsonDecode(data);
      // print(data);
      //
      // var url = 'http://192.168.43.167:5000/otp/send'; //replace '192.168.43.101' with your ip adrress
      // var response = await http.post(url, body: {
      //   'phone_no': dataJson["phone_no"]
      // });
      // Map<String, dynamic> resp = jsonDecode(response.body);
      //
      // if(resp["Status"] == "Success") {
      //   print("Details:\n"+resp["Details"]);
      //   sessionId = resp["Details"];
      // }
      // else{
      //   //show unsuccessful message
      // }
  }

  void verifyOTP() async {
    // var verifyUrl = 'http://192.168.43.167:5000/otp/verify'; //replace '192.168.43.101' with your ip adrress
    // var verifyResp = await http.post(verifyUrl, body: {
    //   'otp': otpController.text,
    //   'session_id': sessionId
    // });
    // print(verifyResp.body);
    // Map<String, dynamic> verifyRespJson = jsonDecode(verifyResp.body);
    // if(verifyRespJson["Status"] == "Success") {
    //   if(widget.signup) {
        Navigator.of(context).push(
          new MaterialPageRoute(builder: (BuildContext context) {
            return Signup();
          })
        );
    //   } else {
    //     //TODO navigate to homescreen because user has logged in successfully...
    //   }
    // } else {
    //   print("Wrong OTP! Please enter OTP again...");
    // }
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
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Image.asset("assets/images/destocklogo.png"),
              width:30,
            ),
            SizedBox(width: 5,),
            Text('De- Stock',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
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
        onTap: verifyOTP,
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
                child: Text('CONTINUE',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _subtitle2() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Didn't receive ?",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OtpPage(signup: widget.signup, login: widget.login,)));
            },
            child: Text(
              'Resent OTP',
              style: TextStyle(
                  color: Color(0xff0000FF),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
  Widget _subtitle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Enter 4 digit OTP sent on xxxxx - xx898",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900,color: Colors.black45),
          ),
        ],
      ),
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
              text: 'Enter OTP',
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
            child:Container(

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
                        Expanded(
                          flex: 3,
                          child: SizedBox(),
                        ),
                        _title(),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: _subtitle(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: otpController,
                           // end onSubmit
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: _subtitle2(),
                        ),
                        _submitButton(),
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        )
                      ],
                    ),
                  ),

                  Positioned(top: 40, left: 0, child: _logobutton()),

                ],
              ),
            )
        )
    );
  }
}