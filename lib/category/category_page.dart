import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class category_page extends StatefulWidget {
  @override
  category_pageState createState() => new category_pageState();
}

class category_pageState extends State<category_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 30,),
          header(),
          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("TOP CATEGORIES",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff595959)),),
            ),
          ),
          SizedBox(height: 30,),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.symmetric(horizontal:5.0),
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 15.0,
            crossAxisCount: 4,
            children: <Widget>[

              GestureDetector(
                  onTap: () {},
                  child: _gridsmall("Electrical Switches", "assets/images/categories/switch 1.png",Color(0xff0B868A))
              ),
              GestureDetector(
                  onTap: () {},
                  child: _gridsmall("Valves", "assets/images/categories/valve 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                  onTap: () {},
                  child: _gridsmall("Cutting Tools", "assets/images/categories/welder 1.png",Color(0xff4B69FF)),
              ),
              GestureDetector(
                  onTap: () {},
                  child: _gridsmall("Filters", "assets/images/categories/air-filter 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                  onTap: () {},
                  child: _gridsmall("Hose Pipe", "assets/images/categories/tube 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                  onTap: () {},
                  child: _gridsmall("Insulation Material", "assets/images/categories/insulation 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                  onTap: () {},
                  child: _gridsmall("Motors", "assets/images/categories/electric-motor 1.png",Color(0xff2DDDB7)),
              ),
              GestureDetector(
                  onTap: () {},
                  child: _gridsmall("Abrasives", "assets/images/categories/Group 5784.png",Color(0xff4B69FF)),
              ),

//              _gridsmall("Electrical Switches", "assets/images/categories/switch 1.png",Color(0xff0B868A)),
//              _gridsmall("Valves", "assets/images/categories/valve 1.png",Color(0xffFC0151)),
//              _gridsmall("Cutting Tools", "assets/images/categories/welder 1.png",Color(0xff4B69FF)),
//              _gridsmall("Filters", "assets/images/categories/air-filter 1.png",Color(0xff0B868A)),
//              _gridsmall("Hose Pipe", "assets/images/categories/tube 1.png",Color(0xffFC0151)),
//              _gridsmall("Insulation Material", "assets/images/categories/insulation 1.png",Color(0xffFC0151)),
//              _gridsmall("Motors", "assets/images/categories/electric-motor 1.png",Color(0xff2DDDB7)),
//              _gridsmall("Abrasives", "assets/images/categories/Group 5784.png",Color(0xff4B69FF)),

            ],
          ),
          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("ALL CATEGORIES",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff595959)),),
            ),
          ),
          SizedBox(height: 30,),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 15.0,
            crossAxisCount: 3,
            children: <Widget>[

              GestureDetector(
                  onTap: () {},
                  child: _grid("Abrasives", "assets/images/categories/Group 5784.png",Color(0xff4B69FF))
              ),
              GestureDetector(
                  onTap: () {},
                  child: _grid("Bearings", "assets/images/categories/bearing 1.png",Color(0xff4B69FF)),
              ),
              GestureDetector(
                  onTap: () {},
                  child: _grid("Circuit Breakers", "assets/images/categories/bearing 1.png",Color(0xff4B69FF)),
              ),
              GestureDetector(
                  onTap: () {},
                  child: _grid("Cutting Tools", "assets/images/categories/welder 1.png",Color(0xff4B69FF)),
              ),
              GestureDetector(
                  onTap: () {},
                  child: _grid("Electrical Fittings", "assets/images/categories/bearing 1.png",Color(0xff4B69FF)),
              ),
              GestureDetector(
                  onTap: () {},
                  child: _grid("Electrical Heaters", "assets/images/categories/heating 1.png",Color(0xff4B69FF)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Electrical Switches", "assets/images/categories/switch 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Fastner", "assets/images/categories/bearing 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Filters", "assets/images/categories/air-filter 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Flanges", "assets/images/categories/bearing 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Gearbox", "assets/images/categories/package-box 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Hardware", "assets/images/categories/screw 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Hose Pipe", "assets/images/categories/tube 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Hydraulic Accessories", "assets/images/categories/bearing 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Hydraulic Cylinders", "assets/images/categories/bearing 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Industrial Belts & V Belts", "assets/images/categories/timing-belt 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Insulation Material", "assets/images/categories/insulation 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Lifting Equipments", "assets/images/categories/bearing 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Lifting Hooks, Chains & Clamps", "assets/images/categories/hook 1.png",Color(0xff2DDDB7)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Measuring Instruments", "assets/images/categories/caliper 1.png",Color(0xff2DDDB7)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Motors", "assets/images/categories/electric-motor 1.png",Color(0xff2DDDB7)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Office Equipments", "assets/images/categories/fax 1.png",Color(0xff2DDDB7)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Oils & Lubricants", "assets/images/categories/oiler 1.png",Color(0xff2DDDB7)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Packaging Material", "assets/images/categories/box (1) 1.png",Color(0xff2DDDB7)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Paint", "assets/images/categories/paint 1.png",Color(0xff4B69FF)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Pipe Fittings", "assets/images/categories/plumbing 1.png",Color(0xff4B69FF)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Pipes", "assets/images/categories/tubes 1.png",Color(0xff4B69FF)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Plates", "assets/images/categories/bearing 1.png",Color(0xff4B69FF)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Plumbing Material", "assets/images/categories/wrench 1.png",Color(0xff4B69FF)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Pneumatic Accessories", "assets/images/categories/bearing 1.png",Color(0xff4B69FF)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Pneumatics Cylinders", "assets/images/categories/bearing 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Ropes", "assets/images/categories/rope 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Rubber Parts", "assets/images/categories/bearing 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Safety Equipments", "assets/images/categories/helmet 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Sheets", "assets/images/categories/bearing 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Springs", "assets/images/categories/vending-machine 1.png",Color(0xff0B868A)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Tools", "assets/images/categories/bearing 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Trolley Wheels", "assets/images/categories/bearing 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Valves", "assets/images/categories/valve 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Welding Consumables", "assets/images/categories/welding 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Wires & Cables", "assets/images/categories/wire 1.png",Color(0xffFC0151)),
              ),
              GestureDetector(
                onTap: () {},
                child: _grid("Wire Mesh & Gratings", "assets/images/categories/bearing 1.png",Color(0xffFC0151)),
              ),

//              _grid("Abrasives", "assets/images/categories/Group 5784.png",Color(0xff4B69FF)),
//              _grid("Bearings", "assets/images/categories/bearing 1.png",Color(0xff4B69FF)),
//              _grid("Circuit Breakers", "assets/images/categories/bearing 1.png",Color(0xff4B69FF)),
//              _grid("Cutting Tools", "assets/images/categories/welder 1.png",Color(0xff4B69FF)),
//              _grid("Electrical Fittings", "assets/images/categories/bearing 1.png",Color(0xff4B69FF)),
//              _grid("Electrical Heaters", "assets/images/categories/heating 1.png",Color(0xff4B69FF)),
//              _grid("Electrical Switches", "assets/images/categories/switch 1.png",Color(0xff0B868A)),
//              _grid("Fastner", "assets/images/categories/bearing 1.png",Color(0xff0B868A)),
//              _grid("Filters", "assets/images/categories/air-filter 1.png",Color(0xff0B868A)),
//              _grid("Flanges", "assets/images/categories/bearing 1.png",Color(0xff0B868A)),
//              _grid("Gearbox", "assets/images/categories/package-box 1.png",Color(0xff0B868A)),
//              _grid("Hardware", "assets/images/categories/screw 1.png",Color(0xff0B868A)),
//              _grid("Hose Pipe", "assets/images/categories/tube 1.png",Color(0xffFC0151)),
//              _grid("Hydraulic Accessories", "assets/images/categories/bearing 1.png",Color(0xffFC0151)),
//              _grid("Hydraulic Cylinders", "assets/images/categories/bearing 1.png",Color(0xffFC0151)),
//              _grid("Industrial Belts & V Belts", "assets/images/categories/timing-belt 1.png",Color(0xffFC0151)),
//              _grid("Insulation Material", "assets/images/categories/insulation 1.png",Color(0xffFC0151)),
//              _grid("Lifting Equipments", "assets/images/categories/bearing 1.png",Color(0xffFC0151)),
//              _grid("Lifting Hooks, Chains & Clamps", "assets/images/categories/hook 1.png",Color(0xff2DDDB7)),
//              _grid("Measuring Instruments", "assets/images/categories/caliper 1.png",Color(0xff2DDDB7)),
//              _grid("Motors", "assets/images/categories/electric-motor 1.png",Color(0xff2DDDB7)),
//              _grid("Office Equipments", "assets/images/categories/fax 1.png",Color(0xff2DDDB7)),
//              _grid("Oils & Lubricants", "assets/images/categories/oiler 1.png",Color(0xff2DDDB7)),
//              _grid("Packaging Material", "assets/images/categories/box (1) 1.png",Color(0xff2DDDB7)),
//              _grid("Paint", "assets/images/categories/paint 1.png",Color(0xff4B69FF)),
//              _grid("Pipe Fittings", "assets/images/categories/plumbing 1.png",Color(0xff4B69FF)),
//              _grid("Pipes", "assets/images/categories/tubes 1.png",Color(0xff4B69FF)),
//              _grid("Plates", "assets/images/categories/bearing 1.png",Color(0xff4B69FF)),
//              _grid("Plumbing Material", "assets/images/categories/wrench 1.png",Color(0xff4B69FF)),
//              _grid("Pneumatic Accessories", "assets/images/categories/bearing 1.png",Color(0xff4B69FF)),
//              _grid("Pneumatics Cylinders", "assets/images/categories/bearing 1.png",Color(0xff0B868A)),
//              _grid("Ropes", "assets/images/categories/rope 1.png",Color(0xff0B868A)),
//              _grid("Rubber Parts", "assets/images/categories/bearing 1.png",Color(0xff0B868A)),
//              _grid("Safety Equipments", "assets/images/categories/helmet 1.png",Color(0xff0B868A)),
//              _grid("Sheets", "assets/images/categories/bearing 1.png",Color(0xff0B868A)),
//              _grid("Springs", "assets/images/categories/vending-machine 1.png",Color(0xff0B868A)),
//              _grid("Tools", "assets/images/categories/bearing 1.png",Color(0xffFC0151)),
//              _grid("Trolley Wheels", "assets/images/categories/bearing 1.png",Color(0xffFC0151)),
//              _grid("Valves", "assets/images/categories/valve 1.png",Color(0xffFC0151)),
//              _grid("Welding Consumables", "assets/images/categories/welding 1.png",Color(0xffFC0151)),
//              _grid("Wires & Cables", "assets/images/categories/wire 1.png",Color(0xffFC0151)),
//              _grid("Wire Mesh & Gratings", "assets/images/categories/bearing 1.png",Color(0xffFC0151)),
            ],
          ),
          SizedBox(height: 20,),
        ],
      )
    );
  }

  Widget _grid(String category, String image, Color color){
    return Container(

      child: Column(
        children: [

          Container(
            width: 70,
            height: 70,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.fromLTRB(0,0,0,10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: color,
            ),
            child: Image.asset(image),
          ),

          Container(
            width: 110,

            child: Text(category, textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,color: Colors.black),),
          ),
        ],
      ),
    );

  }

  Widget _gridsmall(String category, String image, Color color){
    return Container(

      child: Column(
        children: [

          Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.fromLTRB(0,0,0,5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: color,
            ),
            child: Image.asset(image),
          ),

          Container(
            width: 60,
            child: Text(category, textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600,color: Colors.black),),
          ),
        ],
      ),
    );

  }
}

class header extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,


        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset("assets/images/destocklogo.png", height: 50),
            Container(
              width: 250,
              height: 40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 40,
                    color: Colors.black.withOpacity(.16),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(
                          height: 3,
                          child: Icon(Icons.search)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey,fontSize: 12),
                    hintText: "Search for pipes, valves etc.",
                    fillColor: Colors.white),
              ),
            )
          ],
        )
    );
  }
}
