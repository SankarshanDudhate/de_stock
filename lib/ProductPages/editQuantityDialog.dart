import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:destock/utils/textSwitchSlider.dart';
import 'package:get/get.dart';

import 'productPageSeller.dart';

class editQuantity extends StatefulWidget {
  editQuantity({Key key, this.quantity, this.unit}) : super(key: key);
  String unit;
  String quantity;

  @override
  _editQuantityState createState() => _editQuantityState();
}

class _editQuantityState extends State<editQuantity> {
  bool availablity = true;
  String selectedUnit;
  TextEditingController editQtyController = TextEditingController();

  GlobalKey<textSwitchSliderState> availSwitchKey = new GlobalKey();

  var _selectUnit = {"kg", "pieces", "litre"};

  @override
  void initState() {
    super.initState();
    editQtyController.text = widget.quantity;
  }

  Widget _buildAvailablity() {
    return Row(
      children: [
        textSwitchSlider(onText: 'Availability', offText: 'Out of stock', key: availSwitchKey, width: 312,),
      ],
    );
  }

  Widget _buildQuantity() {
    return TextFormField(
      //initialValue: editQtyController.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
      )),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      controller: editQtyController,
    );
  }

  Widget _buildUnit() {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.black),
      child: DropdownButtonFormField<String>(
        items: _selectUnit.map((String dropDownStringItem) {
          return DropdownMenuItem<String>(
            value: dropDownStringItem,
            child: Center(
                child: Text(
              dropDownStringItem,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          );
        }).toList(),
        onChanged: (_value) {
          setState(() {
            this.selectedUnit = _value;
            print(selectedUnit);
          });
        },
        hint: Text(widget.unit,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        value: selectedUnit,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 17, 20, 17),
            filled: true,
            fillColor: Colors.black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
            )),
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
          SizedBox(
            height: 30.0,
          ),
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
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Flexible(child: _buildQuantity()),
              //SizedBox(width:5),
              Flexible(child: _buildUnit())
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Maximum stock which a customer can purchase',
            style: TextStyle(color: Color(0xFF979797), fontSize: 14),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
              var dataToSend = {};
              dataToSend['availability'] = availSwitchKey.currentState.isOn;
              dataToSend['quantity'] = editQtyController.text;
              dataToSend['unit'] = (selectedUnit == null) ? widget.unit : selectedUnit; //if not selected (it becomes null), so return the default unit
              log(selectedUnit.toString());

              String str = jsonEncode(dataToSend);
              //TODO add 'sold through app' popup
              Navigator.pop(context, str);
            },
            child: Container(
              child: Row(
                children: [
                  Text(
                    'CONFIRM',
                    style: TextStyle(
                      color: Color(0xFF4B69FF),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
