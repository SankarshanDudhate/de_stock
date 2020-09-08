import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _key = GlobalKey<FormState>();

  final _currentPasswordController = TextEditingController();
  bool _obscureCurrentPassword = true;

  final _newPasswordController = TextEditingController();
  bool _obscureNewPassword = true;

  final _reenterPasswordController = TextEditingController();
  bool _obscureReEnterPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            "assets/icons/settings.svg",
          ),
        ),
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffFAFAFA),
      ),
      body: Container(
        color: Color(0xffF3F3F3),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/background/background_circles.png"))),
          ),
          ListView(children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    SvgPicture.asset(
                      "assets/icons/key.svg",
                      height: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Change Password",
                      style: TextStyle(
                          color: Color(0xff6F6F6F),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ]),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _key,
                    child: Container(
                      padding: EdgeInsets.all(24.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Enter current password",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xff888888)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _currentPasswordController,
                              obscureText: _obscureCurrentPassword,
                              style: (_obscureCurrentPassword)
                                  ? TextStyle(fontSize: 16, letterSpacing: 8)
                                  : TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: (_obscureCurrentPassword)
                                        ? SvgPicture.asset(
                                            "assets/icons/hide_password.svg")
                                        : SvgPicture.asset(
                                            "assets/icons/show_password.svg"),
                                    onPressed: () {
                                      setState(() {
                                        _obscureCurrentPassword =
                                            !_obscureCurrentPassword;
                                      });
                                    }),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              "Set new password",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xff888888)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _newPasswordController,
                              obscureText: _obscureNewPassword,
                              style: (_obscureNewPassword)
                                  ? TextStyle(fontSize: 16, letterSpacing: 8)
                                  : TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: (_obscureNewPassword)
                                        ? SvgPicture.asset(
                                            "assets/icons/hide_password.svg")
                                        : SvgPicture.asset(
                                            "assets/icons/show_password.svg"),
                                    onPressed: () {
                                      setState(() {
                                        _obscureNewPassword =
                                            !_obscureNewPassword;
                                      });
                                    }),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              "Re-enter password",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xff888888)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _reenterPasswordController,
                              obscureText: _obscureReEnterPassword,
                              style: (_obscureReEnterPassword)
                                  ? TextStyle(fontSize: 16, letterSpacing: 8)
                                  : TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: (_obscureReEnterPassword)
                                        ? SvgPicture.asset(
                                            "assets/icons/hide_password.svg")
                                        : SvgPicture.asset(
                                            "assets/icons/show_password.svg"),
                                    onPressed: () {
                                      setState(() {
                                        _obscureReEnterPassword =
                                            !_obscureReEnterPassword;
                                      });
                                    }),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 160,
                            ),
                            FlatButton(
                                color: Color(0xffFC0151),
                                onPressed: () {},
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "UPDATE",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)))
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
