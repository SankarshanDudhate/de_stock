import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'productPageSeller.dart';


class editQuantity extends StatefulWidget {

  editQuantity({Key key, this.data}): super(key: key);
  String data;

  @override
  _editQuantityState createState() => _editQuantityState(this.data);
}

class _editQuantityState extends State<editQuantity> {

    String data;
  _editQuantityState(this.data);

  bool availablity = true;
  String selectedUnit;
  TextEditingController editQtyController = TextEditingController();

  var _selectUnit = {
      "kg",
      "pieces",
      "litre"
  };
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editQtyController.text = data;
    print("E : " + editQtyController.text);
  }
  

  Widget _buildAvailablity(){
    return Row(
              children: [
                Container(
                  //width: 220,
                  //margin: EdgeInsets.symmetric(horizontal:40),
                  padding: EdgeInsets.symmetric(horizontal:2, vertical:2),
                  decoration: BoxDecoration(
                    border: Border.all( 
                      color : Color(0xFFE6E6E6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(60)
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState((){
                            this.availablity = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
                          decoration: BoxDecoration(
                            color : availablity == true ? Color(0xFF4B69FF) : Color(0xFFFFFFFF),
                            // border: Border.all( 
                            //   color : Color(0xFFFFFF),
                            // ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30)
                            ),
                          ),
                          child: Text('Available', style: availablity == true ? TextStyle( fontSize : 20, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)) : TextStyle( fontSize: 18 , color: Color(0xFF979797)))
                          ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState((){
                            this.availablity = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
                          decoration: BoxDecoration(
                            color : availablity == false ? Color(0xFFD84764) : Color(0xFFFFFFFF),
                            // border: Border.all( 
                            //   color : Color(0xFFFFFF),
                            // ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30)
                            ),
                          ),
                          child: Text('Out of Stock', style: availablity == false ? TextStyle( fontSize : 20, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)) : TextStyle( fontSize: 18 , color: Color(0xFF979797))),
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            );
  }

  Widget _buildQuantity(){
    return TextFormField(
      //initialValue: editQtyController.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          )
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      controller: editQtyController,
    );
  }

  Widget _buildUnit(){
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor : Colors.black
      ),
          child: DropdownButtonFormField<String>(
          items: _selectUnit.map((String dropDownStringItem){
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Center(child: Text(dropDownStringItem,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
            );
          }).toList(),
          onChanged: (_value) {
            setState(() {
              this.selectedUnit = _value;
              print(selectedUnit);
            });
          },
          hint: Text("Select unit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          value: selectedUnit,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 17, 20, 17),
          filled : true,
          fillColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          )
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
        return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAvailablity(),
            SizedBox(height: 30.0,),
            Row(
              children: [
                Text(
                  "CHANGE QUANTITY",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              children: [
                Flexible(child: _buildQuantity()),
                //SizedBox(width:5),
                Flexible(child: _buildUnit())
              ],
            ),
            SizedBox(height:10),
            Text('Maximum stock which a customer can purchase',style: TextStyle(color : Color(0xFF979797), fontSize: 14),),
            SizedBox(height:20),
            GestureDetector(
              onTap: (){
                var dataToSend = {};
                dataToSend['availability'] = availablity;
                dataToSend['quantity'] = editQtyController.text;
                dataToSend['unit'] = selectedUnit;
                //print(dataToSend);
                String str = jsonEncode(dataToSend);
                Navigator.pop(context,str);
              },
              child: Container(
                child: Row(
                  children: [
                    Text('CONFIRM',style: TextStyle(color : Color(0xFF4B69FF), fontSize: 18, fontWeight: FontWeight.bold,),)
                  ],
                ),
              ),
            )
          ],
        ),
                                  
      );
}

}