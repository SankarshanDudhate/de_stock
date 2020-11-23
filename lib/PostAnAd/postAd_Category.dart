import 'dart:convert';
import 'dart:developer';

import 'package:destock/PostAnAd/postAd_3.dart';
import 'package:destock/category/categoryMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostAdCategory extends StatefulWidget {
  @override
  _PostAdCategoryState createState() => _PostAdCategoryState();
}

class _PostAdCategoryState extends State<PostAdCategory> {
  TextEditingController searchController = new TextEditingController();
  TextEditingController addCategoryController = new TextEditingController();
  int selectedCategoryIndex = -1;
  bool searching = false;

  Widget searchBox() {
    return Container(
      //height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 5,
            color: Colors.black.withOpacity(.16),
          ),
        ],
      ),
      child: TextFormField(
        onChanged: (String searchKey) {
          if(!searchKey.isEmpty)
            setState(() {
              searching = true;
            });
          else
            setState(() {
              searching = false;
            });
        },
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: "Search for product category",
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: InputBorder.none,
            suffixIcon: (searching) ? GestureDetector(
                onTap: () {
                  searchController.clear();
                  setState(() {
                    searching = false;
                  });
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.black87,
                )
            ) : GestureDetector(
                onTap: () {
                  if(!searchController.text.isEmpty)
                    setState(() {
                      searching = true;
                    });
                },
                child: Icon(
                  Icons.search,
                  color: Colors.black87,
                )
            ),
        ),
        controller: searchController,
      ),
    );
  }

  Widget _buildAddCategory() {
    return TextField(
      maxLines: 1,
      decoration: new InputDecoration(
          hintText: "Add your product category",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      controller: addCategoryController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              SizedBox(height: 50),
              Center(
                child: Text(
                  "2 Out of 5",
                  style: TextStyle(
                      color: Color(0xff979797),
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              SvgPicture.asset("assets/icons/progress_step_2.svg"),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Step 2",
                    style: TextStyle(
                        color: Color(0xFF4B69FF),
                        fontSize: 20.0,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('SELECT PRODUCT CATEGORY',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              searchBox(),
              SizedBox(
                height: 20,
              ),
              // (searching) ? searchGrid() : categoryGrid(),
              searchGrid(),
              //Show all the categories
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(10),
              //         boxShadow: [
              //           BoxShadow(
              //             offset: Offset(0, 4),
              //             blurRadius: 10,
              //             color: Colors.black.withOpacity(.16),
              //           ),
              //         ]),
              //     child: Padding(
              //       padding: const EdgeInsets.fromLTRB(22, 22, 22, 12),
              //       child: Column(children: <Widget>[
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Text(
              //               "Didn't find your product category?",
              //               style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 16.0,
              //                   fontFamily: "Arial",
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         _buildAddCategory(),
              //         SizedBox(
              //           height: 10,
              //         ),
              //         Text(
              //           "We’ll review this category & add it once it has been approved. ",
              //           style: TextStyle(
              //             fontSize: 12,
              //             color: Color(0xFF979797),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         GestureDetector(
              //           onTap: () {}, //TODO make this work
              //           child: Container(
              //               alignment: Alignment.centerRight,
              //               child: Text("ADD CATEGORY",
              //                   style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                       color: Color(0xFFFC0151)))),
              //         ),
              //         SizedBox(
              //           height: 10,
              //         ),
              //       ]),
              //     )
              // ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  if(selectedCategoryIndex == -1) {
                    Get.snackbar("Error", "Please select a category!");
                    return;
                  }
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  Map adData = jsonDecode(prefs.getString("postAnAdData"));
                  String selectedCategoryName = categoryMapList[selectedCategoryIndex]["name"];
                  adData["category"] = selectedCategoryName;
                  log(adData.toString());
                  prefs.setString("postAnAdData", jsonEncode(adData));

                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new PostAd3()),
                  );
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFFFC0151),
                  ),
                  child: Center(
                    child: Text("NEXT",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ]),
          ),
        ));
  }

  categoryGrid() {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 15.0,
      crossAxisCount: 3,
      children: categoryMapList.map((category) {
        return GridTile(
          child: _grid(category["name"], category["imagePath"],
              categoryMapList.indexOf(category)),
        );
      }).toList(),
    );
  }

  Widget _grid(String category, String image, int categoryIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          this.selectedCategoryIndex = categoryIndex;
        });
      },
      child: Container(
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                // color: color,
                color: (categoryIndex == selectedCategoryIndex)
                    ? Color(0xfffc0151)
                    : Color(0xffc4bcbc),
              ),
              child: Image.asset(image),
            ),
            Container(
              width: 110,
              child: Text(
                category,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  searchGrid() {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 15.0,
      crossAxisCount: 3,
      children: categoryMapList
          .where((element) =>
          element["name"]
              .toString()
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .map((category) {
        return GridTile(
          child: _grid(category["name"], category["imagePath"],
              categoryMapList.indexOf(category)),
        );
      }).toList(),
    );
  }
}
