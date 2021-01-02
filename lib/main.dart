import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Myapp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.white),
  ));
}

class Myapp extends StatefulWidget {
  Myapp({Key key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int _currentSelection = 0;
  int _currentSelection1 = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double cheight = width * 0.6;
    double cwidth = width * 0.9;
    double height = MediaQuery.of(context).size.height;
    List<String> locations = [
      "Near Me",
      "Around 5 KM",
      "Around 10 KM",
      "Around 15 KM",
      "Around 20 KM",
    ];
    // ignore: unused_local_variable
    String _selectedLocation;

    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Alibay",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.black38,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_list_alt,
              color: Colors.black38,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                  duration: Duration(minutes: 2),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  content: Container(
                    width: width,
                    height: height * 0.75,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Reset",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text(
                              "Filter",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            Spacer(),
                            Text(
                              "Apply",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blue),
                            )
                          ],
                        ),
                        Divider(),
                        Container(
                          width: width,
                          child: MaterialSegmentedControl(
                            children: _children,
                            selectionIndex: _currentSelection1,
                            borderColor: Colors.black12,
                            selectedColor: Colors.blue,
                            unselectedColor: Colors.white,
                            borderRadius: 10.0,
                            onSegmentChosen: (index) {
                              setState(() {
                                _currentSelection1 = index;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: width * 0.85,
                          height: 40,
                          padding: EdgeInsets.only(
                            left: 6,
                            right: 6,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 18,
                                color: Color(0xff6d6d6d),
                              ),
                              DropdownButton(
                                  underline: Container(),
                                  iconEnabledColor: Colors.black,
                                  elevation: 10,
                                  iconSize: 30,
                                  hint: Text(
                                    "          Select One           ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedLocation = newValue;
                                    });
                                  },
                                  items: locations.map((locations) {
                                    return DropdownMenuItem(
                                      child: Text(locations),
                                      value: locations,
                                    );
                                  }).toList()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15, right: 10),
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 2.0,
                                        offset: Offset(00, 2),
                                      )
                                    ],
                                    border: Border.all(color: Colors.white10),
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Icon(
                                  Icons.home,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Text(
                              "Categories",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      "assets/a.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  Text(
                                    "Apartment",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )));
            },
          )
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Image.asset(
              'assets/pic.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "The type you interested",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: width,
            child: MaterialSegmentedControl(
              children: _children,
              selectionIndex: _currentSelection,
              borderColor: Colors.white,
              selectedColor: Colors.blue,
              unselectedColor: Colors.white,
              borderRadius: 10.0,
              onSegmentChosen: (index) {
                setState(() {
                  _currentSelection = index;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              height: cheight,
              width: cwidth,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Container(
                    height: cheight * 0.59,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/1.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                  ),
                  Container(
                    height: cheight * 0.39,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                          child: Row(
                            children: [
                              Text(
                                "House",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 13),
                              ),
                              Spacer(),
                              Text(
                                "2 Beds",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 13),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "2 Baths",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 13),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "92sqft",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 13),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: Row(
                            children: [
                              Text(
                                "Antony House",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "\$344.05",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.blue,
                                size: 18,
                              ),
                              Text(
                                "7744 S.Mill Pond Street Wethersfiels,CT",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Map<int, Widget> _children = {
  0: Text('Rent'),
  1: Text('Sale'),
};
