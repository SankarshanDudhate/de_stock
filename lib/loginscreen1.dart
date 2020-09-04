import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

//Just a test comment
//another one

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  TextEditingController returnController(isPass) {
    return isPass ? passwordController : emailController;
  }

  void verifyCredentials() async {
    print(emailController.text + "," + passwordController.text);
    var url = 'http://192.168.43.167:5000/login/in'; //replace '192.168.43.101' with your ip adrress
    var response = await http.post(url, body: {
      'email_id': emailController.text,
      'password': passwordController.text
    });
    print(response.body);
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
              width: 30,
            ),
            SizedBox(width: 5,),
            Text('De- Stock',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }

    Widget _entryField(String title, {bool isPassword = false}) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                obscureText: isPassword,
                controller: returnController(isPassword),
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
        _entryField("Enter phone number / email ID"),
        _entryField("Enter Password", isPassword: true),
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
          child: GestureDetector
            (
            onTap: verifyCredentials,
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
                    child: Text('LOGIN',
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
    Widget _subtitle() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Forgot Password ?',
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
                'Send me OTP',
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
                text: 'Welcome Back',
                style: GoogleFonts.portLligatSans(
                  textStyle: Theme
                      .of(context)
                      .textTheme
                      .display1,
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
              child: Container(

                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                decoration: BoxDecoration(
                  color: Color(0xfff3f3f3),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 150,
                      left: -MediaQuery
                          .of(context)
                          .size
                          .width * .1,
                      child: SvgPicture.asset(
                          "assets/icons/bg_circle_grey.svg"),
                      width: 150,
                      height: 150,),
                    Positioned(
                      top: 250,
                      right: -MediaQuery
                          .of(context)
                          .size
                          .width * .2,
                      child: SvgPicture.asset(
                          "assets/icons/bg_circle_stroke.svg"),
                      width: 350,
                      height: 350,),

                    Positioned(
                      top: 500,
                      right: -MediaQuery
                          .of(context)
                          .size
                          .width * .15,
                      child: SvgPicture.asset("assets/icons/bg_circle.svg"),
                      width: 250,
                      height: 250,),
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
                          _submitButton(),
                          Expanded(
                            flex: 2,
                            child: SizedBox(),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _subtitle(),
                    ),
                    Positioned(top: 40, left: 0, child: _logobutton()),

                  ],
                ),
              )
          )
      );
    }
  }