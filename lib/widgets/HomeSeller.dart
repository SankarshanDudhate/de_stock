import 'package:destock/PostAnAd/postAd.dart';
import 'package:destock/PostAnAd/postAd_4.dart';
import 'package:destock/PostAnAd/postAd_5.dart';
import 'package:destock/PostAnAd/postAd_Category.dart';
import 'package:destock/ProductPages/editProduct.dart';
import 'package:destock/ProductPages/productPage.dart';
import 'package:destock/ProductPages/productPageSeller.dart';
import 'package:destock/category/category_page.dart';
import 'package:destock/dashboard/dashboard.dart';
import 'file:///C:/Users/Sankarshan%20Dudhate/StudioProjects/de_stock/lib/Signup/getstarted.dart';
import 'package:destock/notification_seller/notification_seller.dart';
import 'package:destock/profile/my_profile.dart';
import 'package:destock/wishlist/wishlist_and_enquiry.dart';
import 'package:flutter/material.dart';
import 'package:destock/home_buyer/home_buyer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeSeller extends StatefulWidget {
  @override
  _HomeSellerState createState() => _HomeSellerState();
}

class _HomeSellerState extends State<HomeSeller> {
  // Properties & Variables needed
  final List<Widget> sellerScreens = [
    dashboard(),
    category_page(),
    notification_seller(),
    Profile(),
  ];// to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  PageStorageKey _pageStorageKey = new PageStorageKey("bottomBarPageStorage");
  // Widget currentScreen = homebuyer(); // Our first view in viewport
  int currentTab = 0;
  Widget currentScreen = dashboard();

  @override
  Widget build(BuildContext context) { // Our first view in viewport
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
        key: _pageStorageKey,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffD84764),
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            // currentScreen = PostAd();
            // Get.to(PostAd()); //TODO uncomment this line
            Get.to(PostAd5());
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.only(top: 5),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 0;
                        // currentScreen = dashboard(); // if user taps on this dashboard tab will be active
                        currentScreen = sellerScreens[currentTab]; // if user taps on this dashboard tab will be active
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        currentTab == 0 ? SvgPicture.asset("assets/icons/home_fill.svg", width: 20,) : SvgPicture.asset("assets/icons/home_stroke.svg", width: 20,),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 10,
                            color: currentTab == 0 ? Color(0xffD84764) : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 80,
                    onPressed: () {
                      setState(() {
                        currentTab = 1;
                        currentScreen = sellerScreens[currentTab];
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        currentTab == 1 ? SvgPicture.asset("assets/icons/categories_fill.svg", width: 20,) :SvgPicture.asset("assets/icons/categories_stroke.svg", width: 20,),
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 10,
                            color: currentTab == 1 ? Color(0xffD84764) : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {; // if user taps on this dashboard tab will be active
                        currentTab = 2;
                        currentScreen = sellerScreens[currentTab];
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        currentTab == 2 ? SvgPicture.asset("assets/icons/notification_fill.svg", width: 20,) : SvgPicture.asset("assets/icons/notification_stroke.svg", width: 20,) ,
                        Text(
                          'Notification',
                          style: TextStyle(
                            fontSize: 10,
                            color: currentTab == 2 ? Color(0xffD84764) : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() { // if user taps on this dashboard tab will be active
                        currentTab = 3;
                        currentScreen = sellerScreens[currentTab];
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        currentTab == 3 ? SvgPicture.asset("assets/icons/profile_fill.svg", width: 20,) : SvgPicture.asset("assets/icons/profile_stroke.svg", width: 20,) ,
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 10,
                            color: currentTab == 3 ? Color(0xffD84764) : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
