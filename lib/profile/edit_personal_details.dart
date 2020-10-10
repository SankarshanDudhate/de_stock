import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:destock/utils/input_card.dart';
import 'package:destock/utils/bg_clip.dart';
import 'package:destock/utils/profile_header.dart';
import 'package:destock/utils/raised_container.dart';
import 'package:http/http.dart';

class EditPersonalProfile extends StatelessWidget {
  EditPersonalProfile({Key key}) : super(key: key);
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: ProfileHeader(),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 80),
            child: BgClip(
              height: 450,
            ),
          ),
          ListView(
            padding: EdgeInsets.only(bottom: 16),
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Edit Personal Details ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            TextSpan(
                                text: " ( 1/3 ) ",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: RaisedContainer(
                        // height: 450.0,
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 24),
                          height: 450,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InputCard(
                                title: "NAME",
                                controller: _nameController,
                                placeholder: "Raunak Jainv",
                                subtitle: "Enter your full name",
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              InputCard(
                                title: "E-MAIL ID",
                                controller: _emailController,
                                placeholder: "mittal@mittalcorps.com",
                                subtitle: "Enter your email address",
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              InputCard(
                                title: "PHONE NUMBER",
                                controller: _phoneController,
                                placeholder: "89898 89898",
                                subtitle:
                                    "Enter your phone number as on this device",
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              print(_nameController.value.text);
                              print(_emailController.value.text);
                              print(_phoneController.value.text);
                              post(
                                'http://192.168.43.188:5000/user/edit',
                                body: {
                                  'id': '2',
                                  'name': _nameController.value.text,
                                  'email': _emailController.value.text,
                                  'phone': _phoneController.value.text,
                                },
                              ).then((value) => print(value.body));
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
        ],
      ),
    );
  }
}
