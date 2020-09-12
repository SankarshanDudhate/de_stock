import 'package:destock/account_setting/account_setting.dart';
import 'package:destock/account_setting/change_password.dart';
import 'package:destock/account_setting/payment_details.dart';
import 'package:destock/post_ad_4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'profile/edit_company_details.dart';
import 'profile/edit_contact_person_details.dart';
import 'profile/edit_personal_details.dart';
import 'profile/my_profile.dart';
import 'search/search_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // home: EditPersonalProfile(),
      // home: EditCompanyDetails(),
      // home: ContactPersonDetails(),
      // home: Profile(type: "buyer"),
      // home: AccountSettings(),
      // home: ChangePassword(),
      // home: PaymentDetails(),
      // home: PostAd4(),
      home: SearchHome(),
    );
  }
}
