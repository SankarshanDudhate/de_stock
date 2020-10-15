import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class quicktour extends StatefulWidget {
  quicktour({
    Key key,
  }) : super(key: key);
  @override
  quicktourstate createState() => quicktourstate();
}

class quicktourstate extends State<quicktour> {
  Widget _logoButton() {
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
            SizedBox(
              width: 5,
            ),
            Text('De- Stock',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }

  Widget _headline() {
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
              text: 'Become A Seller',
              style: TextStyle(
                fontFamily: "Domine",
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ]),
    );
  }

  Widget _Descptext() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Text(
            "Start de- stocking your non moving/unused \nstock which might be useful to others and\n improve your cashflow.",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.openSans(color: Color(0xff979797), fontSize: 16.8)),
      ),
    );
  }

  Widget _sapiens() {
    return Container(
      height: 280,
      width: 280,
      child: Image.asset("assets/images/Sapiens2.png"),
    );
  }

  Widget _dots() {
    return Container(
        margin: EdgeInsets.only(top: 40),
        height: 10,
        width: 150,
        child: Image.asset("assets/images/dot2.png"));
  }

  Widget _submitButton() {
    return Container(
      height: 100,
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
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
              child: Text('NEXT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Stack(
        children: <Widget>[
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
                SizedBox(
                  height: 110,
                ),
                _headline(),
                _sapiens(),
                _Descptext(),
                _dots(),
                _submitButton(),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                )
              ],
            ),
          ),
          Positioned(top: 40, left: 0, child: _logoButton()),
        ],
      ),
    )));
  }
}
