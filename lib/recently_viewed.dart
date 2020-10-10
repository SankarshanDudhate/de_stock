import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'cards/product_card_home.dart';
import 'models/RecentProducts.dart';

class recently_viewed extends StatefulWidget {
  recently_viewed({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _recently_viewedState createState() => _recently_viewedState();
}

class _recently_viewedState extends State<recently_viewed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xF8F9FF),
        ),
        child: ListView(
          children: <Widget>[
            header(),
            SizedBox(
              height: 20,
            ),
            recent_view(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class header extends StatelessWidget {
  final String headline1;
  final String headline2;
  final String headline3;
  final String image;
  const header(
      {Key key, this.headline1, this.headline2, this.headline3, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xffD84764),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(90),
        ),
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
            "Items viewed recently",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class recent_view extends StatelessWidget {
  Future<List<RecentProduct>> _getRecentViews() async {
    var response =
        await post('http://192.168.43.188:5000/user/recent', body: {"id": "1"})
            .then((value) => value.body);
    print(recentProductFromJson(response));
    return recentProductFromJson(response);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getRecentViews(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 24,
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return product_card_home(
                  product_name: snapshot.data[index].name,
                  product_price: snapshot.data[index].price.toString(),
                  image: "assets/images/product image.png",
                );
              });
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}
