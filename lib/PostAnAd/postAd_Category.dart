import 'package:destock/PostAnAd/postAd_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostAdCategory extends StatefulWidget {
  @override
  _PostAdCategoryState createState() => _PostAdCategoryState();
}

class _PostAdCategoryState extends State<PostAdCategory> {

  TextEditingController searchController = new TextEditingController();
  TextEditingController addCategoryController = new TextEditingController();

  Widget searchBox() {
    return Container(
      //height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal:20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30),),
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
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: "Search for product category",
          hintStyle: TextStyle(
          color: Colors.grey[400]
        ),
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: () {

            },
            child: Icon(Icons.search,color: Colors.black87,)),
        ),
        controller: searchController,
    ),
    );
  }

  Widget _buildAddCategory(){
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
          padding: EdgeInsets.symmetric(horizontal:20),
          child: Column(
            children:[
              SizedBox(height:50),
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
            SizedBox(height:20),
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
              SizedBox(height:10),
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
                SizedBox(height: 20,),
                searchBox(),
                SizedBox(height: 20,),
                //Show all the categories
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 10,
                          color: Colors.black.withOpacity(.16),
                        ),]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 22, 22, 12),
                    child: Column(
                      children: <Widget>[
                      SizedBox(height: 10.0,),
                      Row(
                      children: [
                        Text(
                          "ENTER PRODUCT NAME",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                      ),
                      SizedBox(height: 10.0,),
                      _buildAddCategory(),
                      SizedBox(height: 10,),
                      Text("We’ll review this category & add it once it has been approved. ", style: TextStyle(fontSize: 12,color:Color(0xFF979797),),),
                      SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text("ADD CATEGORY", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold,color:Color(0xFFFC0151)))
                        ),
                      SizedBox(height: 10,),
                      ]
                      ),
                        )
                    ),
                    SizedBox(height: 50,),
                    GestureDetector(
                      onTap: () {
                          Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) => new PostAd2() ),
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
                            child: Text("NEXT", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                          ),
                        ),
                    ),
                      SizedBox(height: 50,),
                      ]),),
      )
    );
  }
}