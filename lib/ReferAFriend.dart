import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class refer_a_friend extends StatefulWidget {
  refer_a_friend({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _refer_a_friendState createState() => _refer_a_friendState();
}

class _refer_a_friendState extends State<refer_a_friend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xF8F9FF),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            header(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "HOW IT WORKS",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6f6f6f)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Color(0xff0B868A),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Invite your friend to sell at De-stock",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            "All you have to do is share the code with them",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w100,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                      width: 25,
                      child: Center(
                          child: Image.asset(
                        "assets/images/line_ref.png",
                        height: 25,
                      ))),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Color(0xff0B868A),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            "2",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "They accept your invite and register with us",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            "They get 50% off on their first ad",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w100,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                      width: 25,
                      child: Center(
                          child: Image.asset(
                        "assets/images/line_ref.png",
                        height: 25,
                      ))),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Color(0xffD84764),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            "3",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'You get',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ' 50% off ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffD84764),
                            ),
                          ),
                          TextSpan(
                            text: 'on your next Ad',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xffFFF0F3),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "GH45YT",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffD84764)),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffD84764),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Icon(
                      Icons.content_copy,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/images/refer a friend.png",
            )
          ],
        ),
      ),
    );
  }
}

class header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      margin: EdgeInsets.fromLTRB(0, 50, 60, 0),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xff0B868A),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "REFER A FRIEND",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
