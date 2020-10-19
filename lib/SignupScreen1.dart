import 'package:destock/home_buyer/home_buyer.dart';
import 'package:destock/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'loginscreen1.dart';

class Signup extends StatefulWidget {
  //TODO show an 'i' after Password TextFeild label to show instructions for password(min length and all)
  Signup({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  void verifyPassword() {
    print(passwordController.text + "," + rePasswordController.text);
    if( passwordController.text == rePasswordController.text ) {
      //TODO send password to db
      print('Yay! Passswords match...!');

      saveData();
    } else {
      Get.snackbar(
          "Passwords don't match", " Please retry!"
      );
    }
  }

  void saveData() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // String data = await sharedPreferences.getString('signupData');
    // var dataJson = jsonDecode(data);
    // print(data);
    //
    // // Scaffold.of(context).showSnackBar(SnackBar(content:Text(data)));
    //
    //TODO send firebase token
    // var url = 'http://192.168.43.167:5000/signup/'; //replace '192.168.43.101' with your ip adrress
    // var response = await http.post(url, body: {
    //   'email_id': dataJson["email_id"],
    //   'password': passwordController.text,
    //   "name": dataJson["name"],
    //   "phone_no": dataJson["phone_no"]
    // });
    // print(response.body);
    //
    // Map<String, dynamic> resp = jsonDecode(response.body);
    //
    // if(resp["Status"] == "Success") {
    //   print("Details:\n"+resp["Details"]);
    //   Get.snackbar(
    //       "Yay!", "Signup succesful!"
    //   );
    //   //TODO send user to homepage/dashboard
    // }
    // else{
    //   //show unsuccessful message
    //   Get.snackbar(
    //     "Error", "Signup failed!"
    //   );
    // }
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (BuildContext context) {
          return Home();
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

  Widget _entryField(String title, bool isPassword, bool isReEnterField) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle( fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              controller: isReEnterField ? rePasswordController : passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xffffffff),
                  filled: true))
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(children: <Widget>[
      _entryField("Set password", true, false),
      _entryField("Re-enter Password", true, true),
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
        onTap: verifyPassword,
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
                child: Text('SIGN UP',
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
  Widget _subtitle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: SvgPicture.asset("assets/icons/check-square.svg", width: 20,),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'I agree to',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              'terms and conditions',
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
              text: 'Create Account',
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
                        _emailPasswordWidget(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: _subtitle(),
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