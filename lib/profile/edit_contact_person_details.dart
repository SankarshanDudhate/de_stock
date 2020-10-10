import 'dart:convert';
import 'dart:developer';

import 'package:destock/CONSTANTS.dart';
import 'package:destock/profile/my_profile.dart';
import 'package:destock/utils/bg_clip.dart';
import 'package:destock/utils/input_card.dart';
import 'package:destock/utils/profile_header.dart';
import 'package:destock/utils/raised_container.dart';
import 'package:destock/validatons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditContactPersonDetails extends StatefulWidget {
  EditContactPersonDetails({Key key}) : super(key: key);

  @override
  _EditContactPersonDetailsState createState() =>
      _EditContactPersonDetailsState();
}

class _EditContactPersonDetailsState extends State<EditContactPersonDetails> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool contactPersonExists =
      true; //Change it to false if user enables the latch

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: ProfileHeader(),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Contact Person Details ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  TextSpan(
                      text: " ( 3/3 ) ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ))
                ],
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: BgClip(
                          height: 450,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: RaisedContainer(height: 450.0),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                        height: 450,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputCard(
                              title: "NAME",
                              controller: _nameController,
                              placeholder: "Atul Mittal",
                              subtitle:
                                  "Enter name of the person with whom the buyer will connect",
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            InputCard(
                              title: "E-MAIL ID",
                              controller: _emailController,
                              placeholder: "mittal@mittalcorp.com",
                              subtitle:
                                  "Enter email ID of the above mentioned contact person",
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            InputCard(
                              title: "PHONE NUMBER",
                              controller: _phoneController,
                              placeholder: "89898 89898",
                              subtitle:
                                  "Enter phone number of the above mentioned contact person",
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      onPressed: () {},
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Color(0xffD84764),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      color: Color(0xffD84764),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          String name = _nameController.value.text;
                          String email = _emailController.value.text;
                          String phoneNo = _phoneController.value.text;

                          if (!validateName(name)) {
                            // print("Please enter a valid name!");
                            Get.snackbar("Invalid details",
                                "Please enter a valid name!");
                            return;
                          }
                          if (!validateEmail(email)) {
                            // #print("");
                            Get.snackbar("Invalid details",
                                "Please enter a valid email!");
                            return;
                          }
                          if (!validatePhoneNo(phoneNo)) {
                            Get.snackbar("Invalid details",
                                "Please enter a valid phone number!");
                            return;
                          }

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          Map<String, dynamic> profileData =
                              jsonDecode(prefs.getString("profileEditDetails"));
                          profileData["contact_person_exists"] =
                              contactPersonExists.toString();
                          profileData["contact_person_name"] = name;
                          profileData["contact_person_email"] = email;
                          profileData["contact_person_phoneNo"] = phoneNo;

                          prefs.setString(
                              "profileEditDetails", jsonEncode(profileData));
                          log(jsonEncode(profileData));

                          String userid = prefs.getString("userid") == null
                              ? '1'
                              : prefs.getString("userid");
                          String url = localhostAddress +
                              "/users/" +
                              userid +
                              "/edit/profile/";
                          print(url);

                          var resp = await http.post(url, body: profileData);
                          print(resp.body);
                          if (jsonDecode(resp.body)["Status"] == "Success")
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => Profile()));
                          else
                            Get.snackbar("Error!", "Could not update profile... Please try again later!");
                        }
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
