import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class plan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 50),
            height: 100,
            width: 300,
            decoration: BoxDecoration(
                color: Color(0xff0B868A),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Row(
              children: [
                SizedBox(width: 10),
                Icon(Icons.arrow_back_ios, color: Colors.white),
                SizedBox(width: 10),
                Text("PRICING PLANS",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24))
              ],
            )),
        Center(
            child: Text(
          "Select the right plan and\n improve your cash flow",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        )),
        Container(
          height: 500,
          width: 650,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Group.png"),
            ),
            // color: Colors.red
          ),
          padding: EdgeInsets.symmetric(horizontal: 64, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                // color: Colors.green,
                height: 112,
                width: 280,
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 45,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "1",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: "Ad",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "100",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              TextSpan(
                                text: "/Ad",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Text("2 Months")
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                // color: Colors.green,
                height: 112,
                width: 280,
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "10",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: "Ad",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "90",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              TextSpan(
                                text: "/Ad",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "2 Months",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 36,
              ),
              Container(
                // color: Colors.green,
                height: 112,
                width: 280,
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "50",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: "Ad",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "80",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              TextSpan(
                                text: "/Ad",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "2 Months",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
