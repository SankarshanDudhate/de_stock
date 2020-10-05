import 'package:destock/home_buyer/home_buyer.dart';
import 'package:destock/loginscreen1.dart';
import 'package:destock/home_buyer/recently_viewed.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:convert';

import 'package:destock/account_setting/account_setting.dart';
import 'package:destock/account_setting/change_password.dart';
import 'package:destock/account_setting/confirm_deactivate_account.dart';
import 'package:destock/account_setting/payment_details.dart';
import 'package:destock/notification_seller/notification_seller.dart';
import 'package:destock/post_ad_4.dart';
import 'package:destock/wishlist/wishlist_and_enquiry.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:destock/getstarted.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'post_an_ad 4.dart';
import 'widgets/home2.dart';
import 'profile/edit_company_details.dart';
import 'profile/edit_contact_person_details.dart';
import 'profile/edit_personal_details.dart';
import 'profile/my_profile.dart';
import 'search/search_home.dart';

import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flushbar/flushbar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

//No longer needed as static function works now
// Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) {
//   log(message["data"]["type"]);
//   // Get.snackbar("OnLaunch", message["data"]["type"], duration: Duration(seconds: 10));
// }

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription uriStream;
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    firebaseMessagingInit();
    initUniLinks();
    initNotificationsPlugin();
  }

  void initUniLinks() async {
    try {
      Uri initUri = await getInitialUri();
      if (initUri != null) {
        // Flushbar(message: "Initial Uri: " + initUri.toString(),);
        Get.snackbar("Initial Uri: ", initUri.toString(),);
        log("Initial: " + initUri.toString());
      }

      uriStream = getUriLinksStream().listen((Uri newUri) {
        if (newUri != null) {
          log("New: " + newUri.toString());
          // Flushbar(message: "New Uri: " + newUri.toString(),);
          Get.snackbar("New Uri: ", newUri.toString());
          var queryParameters = newUri.queryParameters;
          log("Query: $queryParameters");
          //pass the query parameters user_id and shareableHash to wishlist_shared.dart
        }
      });
    } on PlatformException {
      // Flushbar(message: "Error occured!",);
      Get.snackbar("Error", "Platform exception caught!");
      log("Platform exception caught while handling app links...");
    }
  }

  void firebaseMessagingInit() async {
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    String firebaseToken = await fbm.getToken();
    // log(firebaseToken);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("firebaseDeviceToken") == null)
      prefs.setString("firebaseDeviceToken", firebaseToken);

    fbm.subscribeToTopic("testTopic");
    fbm.configure(
      onMessage: (Map<String, dynamic> message) async {
        log("onMessage: $message");
        // Flushbar(message: "OnMessage:", duration: Duration(seconds: 5),)..show(scaffoldKey.currentContext);
        await saveNotification(message);
        Get.snackbar(
            "New notification", "You have a new "+message["data"]["type"],
            duration: Duration(seconds: 6),
            onTap: (GetBar snackbar) {
              navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => notification_seller()));
            }
        );
      },
      // onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        log("onLaunch: $message");
        Get.snackbar("OnLaunch", message["data"]["type"], duration: Duration(seconds: 10));
        // Flushbar(message: "OnLaunch:",)..show(scaffoldKey.currentContext);
        saveNotification(message);
        // navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => notification_seller()));
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onResume: (Map<String, dynamic> message) async {
        log("onResume: $message");
        Get.snackbar("OnResume", message["data"]["type"], duration: Duration(seconds: 10));
        // Flushbar(message: "OnResume: $message",)..show(scaffoldKey.currentContext);
        saveNotification(message);
        // navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => notification_seller()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: Scaffold(
          key: scaffoldKey,
          body: homebuyer()
          // body: EditPersonalProfile(),
          // body: EditCompanyDetails(),
          // body: ContactPersonDetails(),
          // body: Profile(type: "buyer"),
          // body: AccountSettings(),
          // body: ChangePassword(),
          // body: PaymentDetails(),
          // body: PostAd4(),
          // body: SearchHome(),
          // body: MyHome(),
          //body: WishlistAndEnquiry()
      ),
    );
  }

  // void saveNotification(Map<String, dynamic> message) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String notifString = prefs.getString("notifications");
  //   List notifList = [];
  //
  //   if( notifString != null) {
  //     var notifs = jsonDecode(notifString);
  //     log("Previous notifs type: "+notifs.runtimeType.toString()+"\n\n");
  //     // notifList = notifs;
  //   } else {
  //     log("It is null");
  //     notifString = '';
  //   }
  //
  //   message["read"] = false;
  //   message["received_date"] = new DateTime.now().toIso8601String();
  //   notifList.insert(0, message);
  //   String newNotifString = jsonEncode(notifList).toString();
  //   // log(newNotifString);
  //   prefs.setString("notifications", newNotifString);
  //   log("New notifs: \n\n$newNotifString\n\n");
  // }

  //hot restart after writing static functions otherwise they won't work
  static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
    print('AppPush myBackgroundMessageHandler : '+message["data"]["user_name"]);
    // _showNotification(message);
    // Get.snackbar(
    //     "New notification", "You have a new "+message["data"]["user_name"],
    //     duration: Duration(seconds: 6),
    //     // onTap: (GetBar snackbar) {
    //     //   navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => notification_seller()));
    //     // }
    // );
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'your channel id', 'your channel name', 'your channel description',
          importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
          0, 'plain title', 'plain body', platformChannelSpecifics,
          payload: 'item x');

    return Future<void>.value();
  }

  void initNotificationsPlugin() async {
    // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: localNotificationHandler,
    //         (int id, String title, String body, String payload) async {
    //   didReceiveLocalNotificationSubject.add(ReceivedNotification(
    //       id: id, title: title, body: body, payload: payload));
    // });
        );
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }


  Future selectNotification(String payload) async {
    if (payload != null) {
      log('notification payload: ' + payload);
      Get.snackbar(
        "New notification", "You have a new "+payload,
        duration: Duration(seconds: 6),
        // onTap: (GetBar snackbar) {
        //   navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => notification_seller()));
        // }
      );
    }
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SecondScreen(payload)),
    // );
  }

  Future localNotificationHandler(int id, String title, String body, String payload) async {
    if (payload != null) {
      log('Received notification: ' + payload);
      Get.snackbar(
        "Did Receive", "Data: $id, $title, $body,\n$payload",
        duration: Duration(seconds: 6),
        // onTap: (GetBar snackbar) {
        //   navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => notification_seller()));
        // }
      );
    }
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SecondScreen(payload)),
    // );
  }
}


void saveNotification(Map<String, dynamic> message) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String notifString = prefs.getString("notifications");
  List notifList = [];

  if( notifString != null) {
    var notifs = jsonDecode(notifString);
    log("Previous notifs type: "+notifs.runtimeType.toString()+"\n\n");
    // notifList = notifs;
  } else {
    log("It is null");
    notifString = '';
  }

  message["read"] = false;
  message["received_date"] = new DateTime.now().toIso8601String();
  notifList.insert(0, message);
  String newNotifString = jsonEncode(notifList).toString();
  // log(newNotifString);
  prefs.setString("notifications", newNotifString);
  log("New notifs: \n\n$newNotifString\n\n");
}
