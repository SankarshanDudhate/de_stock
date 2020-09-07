import 'package:flutter/material.dart';
import 'profile/edit_company_details.dart';
import 'profile/edit_contact_person_details.dart';
import 'profile/edit_personal_details.dart';
import 'profile/my_profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // home: EditPersonalProfile(),
      // home: EditCompanyDetails(),
      // home: ContactPersonDetails(),
      home: Profile(
        type: "buyer",
      ),
    );
  }
}
