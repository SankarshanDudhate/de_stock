import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xffFAFAFA),
            image: DecorationImage(
                image: AssetImage('assets/background/background_help.png'),
                fit: BoxFit.fill)),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 60, 16),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Color(0xff0B868A),
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(16))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FAQs",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    color: Colors.white,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 8),
                      childrenPadding: EdgeInsets.all(8),
                      title: Text('How do i change my product name?'),
                      children: [
                        Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled ")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    color: Colors.white,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 8),
                      childrenPadding: EdgeInsets.all(8),
                      title: Text('How do i change my product name?'),
                      children: [
                        Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled ")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    color: Colors.white,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 8),
                      childrenPadding: EdgeInsets.all(8),
                      title: Text('How do i change my product name?'),
                      children: [
                        Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled ")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    color: Colors.white,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 8),
                      childrenPadding: EdgeInsets.all(8),
                      title: Text('How do i change my product name?'),
                      children: [
                        Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled ")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    color: Colors.white,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 8),
                      childrenPadding: EdgeInsets.all(8),
                      title: Text(
                          'How do I get my refund if the payment is not processed?'),
                      children: [
                        Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled ")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    color: Colors.white,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 8),
                      childrenPadding: EdgeInsets.all(8),
                      title: Text('How do i change my product name?'),
                      children: [
                        Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled ")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn’t answer your questions?",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Feel free to contact us!",
                  style: TextStyle(
                      color: Color(0xff36868E),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 104,
                  width: 240,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 1,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CALL US",
                        style: TextStyle(
                            color: Color(0xff4B69FF),
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '89898 89898',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.phone,
                            color: Color(0xff36868E),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '89898 89898',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.phone,
                            color: Color(0xff36868E),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: 100,
                  width: 240,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 1,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WRITE TO US",
                        style: TextStyle(
                            color: Color(0xff4B69FF),
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "destock@gmail.com",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.mail_outline,
                            color: Colors.red,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }
}
