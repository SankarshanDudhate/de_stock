import 'package:destock/ProductPages/editProduct.dart';
import 'package:destock/ProductPages/productPage.dart';
import 'package:destock/ProductPages/productPageSeller.dart';
import 'package:destock/category/category_page.dart';
import 'package:destock/dashboard/dashboard.dart';
import 'package:destock/Signup/getstarted.dart';
import 'package:destock/notification_buyer/notification_buyer.dart';
import 'package:destock/notification_seller/notification_seller.dart';
import 'package:destock/profile/my_profile.dart';
import 'package:destock/wishlist/wishlist_and_enquiry.dart';
import 'package:flutter/material.dart';
import 'package:destock/home_buyer/home_buyer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBuyer extends StatefulWidget {
  @override
  _HomeBuyerState createState() => _HomeBuyerState();
}

class _HomeBuyerState extends State<HomeBuyer> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> buyerScreens = [
    homebuyer(),
    category_page(),
    Profile(),
    notification_seller(),
  ];
// to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  PageStorageKey _pageStorageKey = new PageStorageKey("bottomBarPageStorage");
  // Widget currentScreen = homebuyer(); // Our first view in viewport
  Widget currentScreen;

  @override
  Widget build(BuildContext context) {
    currentScreen = buyerScreens[0]; // Our first view in viewport
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
        key: _pageStorageKey,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffD84764),
        child: Icon(Icons.favorite),
        onPressed: () {
          setState(() {
            currentScreen =
                WishlistAndEnquiry();
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
                        currentScreen =
                            homebuyer(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
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
                        currentScreen =
                            category_page();
                        currentTab = 1;
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
                      setState(() {
                        currentScreen =
                            notification_seller(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
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
                      setState(() {
                        currentScreen =
                            Profile(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
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
