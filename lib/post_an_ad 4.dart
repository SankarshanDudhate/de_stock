import 'package:flutter/material.dart';

class postAd_4 extends StatefulWidget {

  @override
  _postAd_4State createState() => _postAd_4State();
}

class _postAd_4State extends State<postAd_4> {
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal:20),
          child: Column(
              children: [
                SizedBox(height:50),
                Row(
                  children: [
                    Text(
                      "Step 4",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20.0,
                          fontFamily: "Arial",
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height:10),
                Row(
                  children: [
                    Text('SELECT A PAYMENT PLAN',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                Row(
                  children: [
                    plan_card(
                      image: "assets/images/plan_inactive.png",
                      title: "hi",
                    ),
                    plan_card(
                      image: "assets/images/plan_inactive.png",
                      title: "hi",
                    ),
                    plan_card(
                      image: "assets/images/plan_inactive.png",
                      title: "hi",
                    ),



                  ],
                ),
              ]
          ),
        )
    );
  }
}

class plan_card extends StatelessWidget {
  final String title;
  final String image;

  const plan_card({Key key, this.title, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 120,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10),),

          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 20,
              color: Color(0xffE5E5E5).withOpacity(0.5),
            ),
          ],
        ),
        child: Stack(

          children: <Widget>[
            Image.asset(image, height: 200,width: 120,),
            Text(title,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),),
          ],
        )
    );
  }
}




