import 'package:destock/InnerDashboard/enquiries.dart';
import 'package:destock/InnerDashboard/manageProducts.dart';
import 'package:destock/ProductPages/editProduct.dart';
import 'package:destock/ProductPages/productPage.dart';
import 'package:destock/ProductPages/productPageSeller.dart';
import 'package:destock/Signup/SignupScreen1.dart';
import 'package:destock/Signup/getstarted.dart';
import 'package:destock/home_buyer/home_buyer.dart';
import 'package:destock/Login/loginscreen1.dart';
import 'package:destock/home_buyer/recently_viewed.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:convert';

import 'package:destock/account_setting/account_setting.dart';
import 'package:destock/account_setting/change_password.dart';
import 'package:destock/account_setting/confirm_deactivate_account.dart';
import 'package:destock/account_setting/payment_details.dart';
import 'package:destock/notification_buyer/notification_buyer.dart';
import 'package:destock/notification_seller/notification_seller.dart';
import 'package:destock/payment/payment_test.dart';
import 'package:destock/post_an_ad 4.dart';
import 'package:destock/widgets/home.dart';
import 'package:destock/wishlist/wishlist_and_enquiry.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'post_an_ad 4.dart';
import 'widgets/HomeSeller.dart';
import 'profile/edit_company_details.dart';
import 'profile/edit_contact_person_details.dart';
import 'profile/edit_personal_details.dart';
import 'profile/my_profile.dart';
import 'search/search_home.dart';

import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flushbar/flushbar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

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
  Widget firstScreen;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    firebaseMessagingInit();
    initFirstScrren();
    initUniLinks();
    initNotificationsPlugin();
  }

  void initFirstScrren() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('user_id');
    if(userId == null) {
      firstScreen = getstarted();
    } else {
      // String userType = prefs.getString('user_type');
      // if(userType == "buyer") firstScreen = HomeBuyer();
      // if(userType == "seller") firstScreen = HomeSeller();
      firstScreen = HomeSeller();
    }
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
    //TODO handle token refresh

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("firebaseDeviceToken") == null)
      prefs.setString("firebaseDeviceToken", firebaseToken);

    fbm.subscribeToTopic("testTopic");
    fbm.configure(
      onMessage: (Map<String, dynamic> message) async {
        log("onMessage: $message");
        await saveNotification(message);

        String notificationBody = '';

        if (message["data"]["type"] == "enquiry") notificationBody = "You have a new enquiry";
        else if(message["data"]["type"] == "wishlisted_count") notificationBody = "Your product was wishlisted "+message["wishlisted_count"]+" times";
        else if(message["data"]["type"] == "views_count") notificationBody = "Your product was wishlisted "+message["views_count"]+" times";
        else if(message["data"]["type"] == "reply") notificationBody = "You have a reply to your quotation enquiry";

        Get.snackbar(
          "New notification", notificationBody,
          duration: Duration(seconds: 6),
          onTap: (GetBar snackbar) {
            if (message["data"]["user_type"] == "seller") {
              log('notification payload: ' + message["data"]["user_type"]);
              navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => notification_seller()));
            } else if (message["data"]["user_type"] == "buyer") {
              log('notification payload: ' + message["data"]["user_type"]);
              navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => notification_seller()));
            }
          }
        );
      },
      // onBackgroundMessage: myBackgroundMessageHandler,
      // onLaunch: (Map<String, dynamic> message) async {
      //   log("onLaunch: $message");
      //   Get.snackbar("OnLaunch", message["data"]["type"], duration: Duration(seconds: 10));
      //   // Flushbar(message: "OnLaunch:",)..show(scaffoldKey.currentContext);
      //   saveNotification(message);
      //   // navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => notification_seller()));
      // },
      onBackgroundMessage: myBackgroundMessageHandler,
      // onResume: (Map<String, dynamic> message) async {
      //   log("onResume: $message");
      //   Get.snackbar("OnResume", message["data"]["type"], duration: Duration(seconds: 10));
      //   // Flushbar(message: "OnResume: $message",)..show(scaffoldKey.currentContext);
      //   saveNotification(message);
      //   // navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => notification_seller()));
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        );
      },
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: Scaffold(
          key: scaffoldKey,
          // body: PaymentTest(),
          // body: productPageSeller()
          // body: editProduct()
          // body: productPage()
          // body: homebuyer()
          // body: getstarted(),
          // body: EditPersonalProfile(),
          // body: EditCompanyDetails(),
          // body: EditContactPersonDetails(),
          // body: Profile(type: "buyer"),
          // body: AccountSettings(),
          // body: ChangePassword(),
          // body: PaymentDetails(),
          // body: PostAd4(),
          // body: SearchHome(),
          // body: MyHome(),
          // body: WishlistAndEnquiry(),
          // body: Enquiries(),
          // body: manageProducts(),
          // body: getstarted(),
        body: HomeSeller(),
          // body: firstScreen,
      ),
    );
  }

  static void saveNotification(Map<String, dynamic> message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String notifString = prefs.getString("notifications");
    List notifList = [];

    if( notifString != null) {
      var notifs = jsonDecode(notifString);
      // log("Previous notifs type: "+notifs.runtimeType.toString()+"\n\n");
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

  //hot restart after writing static functions otherwise they won't work
  static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
    // print('AppPush myBackgroundMessageHandler : '+message["data"]["user_type"]);
    saveNotification(message);

    String notificationBody = '';

    if (message["data"]["type"] == "enquiry") notificationBody = "You have a new enquiry";
    else if(message["data"]["type"] == "wishlisted_count") notificationBody = "Your product was wishlisted "+message["wishlisted_count"]+" times";
    else if(message["data"]["type"] == "views_count") notificationBody = "Your product was wishlisted "+message["views_count"]+" times";
    else if(message["data"]["type"] == "reply") notificationBody = "You have a reply to your quotation enquiry";

    //This code shows notification
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'You have a new notification', notificationBody, platformChannelSpecifics,
        payload: message["data"]["user_type"]);

  }

  void initNotificationsPlugin() async {
    // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: iOSNotificationHandler,
    );
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: androidNotificationHandler);
  }

  //Handles notification clicks on android
  Future androidNotificationHandler(String payload) async {
    if (payload == "seller") {
      log('notification payload: ' + payload);
      navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => notification_seller()));
    } else if (payload == "buyer") {
      log('notification payload: ' + payload);
      navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => notification_seller()));
    }
  }

  //hanldes notification on iOS
  Future iOSNotificationHandler(int id, String title, String body, String payload) async {
    if (payload != null) {
      log('Received notification: ' + payload);
      Get.snackbar(
        "Did Receive", "Data: $id, $title, $body,\n$payload",
        duration: Duration(seconds: 6),
      );
    }
  }
}