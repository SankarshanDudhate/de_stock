import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  dashboard({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _dashboardState createState() => _dashboardState();
}
class _dashboardState extends State<dashboard> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:Stack(
              children: [
                Container(

                  decoration: BoxDecoration(
                    color: Color(0xF8F9FF),
                  ),

                  child: Column(

                    children: <Widget>[
                      header(
                        headline1:'Hello Ajay',
                        headline2:'Welcome to your dashboard !',
                        headline3:'Complete you profile for better reach!',
                        image: "assets/images/USER PROFILE PIC.png",
                      ),

                      SizedBox(height: 70,),
                      option_cards(),
                      SizedBox(height: 20,),
                      Title_with_no(
                        title: "Your Products",
                        number: "(0)",
                      ),
                      SizedBox(height: 20,),
                      Image.asset("assets/images/dashboard_sapien1.png",width: 300,),
                      SizedBox(height: 20,),
                      Text("All the products which you will add to\nDe-stock will come here",textAlign: TextAlign.center,),
                      SizedBox(height: 10,),
                      submitButton(
                        title: "START ADDING YOUR PRODUCTS",
                      ),
                      SizedBox(height: 0,),
                      Title_with_no(
                        title: "Latest Enquiries",
                        number: "(0)",
                      ),
                      SizedBox(height: 20,),
                      Image.asset("assets/images/dashboard_sapien2.png",width: 300,),
                      SizedBox(height: 20,),
                      Text("All enquiries for your products will\ncome here",textAlign: TextAlign.center,),
                      SizedBox(height: 50,),
                      Title_with_no(
                        title: "Upcoming Renewals",
                        number: "(0)",
                      ),
                      SizedBox(height: 20,),
                      Image.asset("assets/images/dashboard_sapien3.png",width: 300,),
                      SizedBox(height: 20,),
                      Text("Renewal for your ads will come here",textAlign: TextAlign.center,),
                      SizedBox(height: 20,),
                      Text("Post your first ad",textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffD84764)),),
                      SizedBox(height: 20,),
                      submitButton(
                        title: "VIEW ALL PLANS",
                      ),
                      SizedBox(height: 40,),
                    ],
                  ),
                ),
                Positioned(
                  top:150,
                  left: 71.5,
                  child: product_view_card(
                    products:'0',
                    pro_text:'Active\nProducts',
                    views:'0',
                    view_text: "Total\nviews",
                  ),
                ),
              ],
            )
        )
    );
  }

}

class header extends StatelessWidget {
  final String headline1;
  final String headline2;
  final String headline3;
  final String image;
  const header({Key key, this.headline1, this.headline2,this.headline3, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          color: Color(0xffD84764),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(headline1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                Text(headline2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),),
                Text(headline3,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),),
              ],
            ),
            Image.asset(image, height: 50),
          ],
        )
    );
  }
}

class product_view_card extends StatelessWidget {
  final String products;
  final String views;
  final String pro_text;
  final String view_text;
  final String image;
  const product_view_card({Key key, this.products, this.views,this.pro_text, this.view_text,this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: 250,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20),),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 20,
              color: Colors.black.withOpacity(.16),
            ),
          ],


        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(products,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                Text(pro_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
              ],
            ),
            VerticalDivider(color: Colors.black38,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(views,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                Text(view_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
              ],
            ),
          ],
        )
    );
  }
}



class options_small extends StatelessWidget {
  final String title;
  final String image;
  const options_small({Key key, this.title, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10),),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: Color(0xffE5E5E5).withOpacity(1),
            ),
          ],

        ),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(image, height: 18,),
            SizedBox(width: 5,),
            Text(title,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),),
          ],
        )
    );
  }
}

class options_large extends StatelessWidget {
  final String title;
  final String image;
  const options_large({Key key, this.title, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 180,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10),),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: Color(0xffE5E5E5).withOpacity(1),
            ),
          ],

        ),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(image, height: 18,),
            SizedBox(width: 5,),
            Text(title,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),),
          ],
        )
    );
  }
}

class option_cards extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 100,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                options_large(
                  title: "Manage your products",
                  image: "assets/images/manage_products.png",
                ),
                SizedBox(width: 10,),
                options_small(
                  title: "My profile",
                  image: "assets/images/myprofile.png",
                ),
              ],
            ),
            VerticalDivider(color: Colors.black38,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                options_small(
                  title: "Enquiries",
                  image: "assets/images/enquiries.png",
                ),
                SizedBox(width: 10,),
                options_large(
                  title: "Renewals & Billings",
                  image: "assets/images/renewals.png",
                ),
              ],
            ),
          ],
        )
    );
  }
}
class Title_with_no extends StatelessWidget {
  final String title;
  final String number;
  const Title_with_no({Key key, this.title, this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Text(title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
          Text(number,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black45),),
        ],

      ),
    );

  }
}

class submitButton extends StatelessWidget {
  final String title;
  const submitButton({Key key, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 90,
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
                color: Color(0xffD84764),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              alignment: Alignment.center,
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
            ),
          ),


        ],
      ),
    );

  }
}


