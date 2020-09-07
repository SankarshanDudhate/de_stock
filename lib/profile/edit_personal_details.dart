import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ilx/profile/utils/input_card.dart';

import 'utils/bg_clip.dart';
import 'utils/profile_header.dart';
import 'utils/raised_container.dart';

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
      body: ListView(children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Edit Personal Details",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
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
                              title: "NAME*",
                              controller: _nameController,
                              placeholder: "Raunak Jainv",
                              subtitle: "Enter your full name",
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            InputCard(
                              title: "E-MAIL ID*",
                              controller: _emailController,
                              placeholder: "mittal@mittalcorps.com",
                              subtitle: "Enter your email address",
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            InputCard(
                              title: "PHONE NUMBER*",
                              controller: _phoneController,
                              placeholder: "89898 89898",
                              subtitle:
                                  "Enter your phone number as on this device",
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    onPressed: () {},
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Color(0xffD84764),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    color: Color(0xffD84764),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print(_nameController.value.text);
                        print(_emailController.value.text);
                        print(_phoneController.value.text);
                      }
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
