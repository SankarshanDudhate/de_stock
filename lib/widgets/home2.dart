import 'package:destock/profile/my_profile.dart';
import 'settings.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
import '../dashboard/dashboard.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
   // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(

        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffD84764),
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 60,
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
                         // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/dashboard_fill.svg", width: 25,),
                        /*Icon(
                          Icons.dashboard,
                          color: currentTab == 0 ? Color(0xffD84764) : Colors.grey,
                        ),*/
                        Text(
                          'Dashboard',
                          style: TextStyle(
                            fontSize: 10,
                            color: currentTab == 0 ? Color(0xffD84764) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/categories_stroke.svg", width: 25,),
                        Text(
                          'Categories',
                          style: TextStyle(
                            color: currentTab == 1 ? Color(0xffD84764) : Colors.grey,
                            fontSize: 10,
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
                         // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/profile.svg", width: 25,),
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 10,
                            color: currentTab == 2 ? Color(0xffD84764) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset("assets/icons/notification.svg", width: 25,),
                        Text(
                          'Notification',
                          style: TextStyle(
                            fontSize: 10,
                            color: currentTab == 3 ? Color(0xffD84764) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
