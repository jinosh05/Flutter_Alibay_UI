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
  Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  late PersistentBottomSheetController _controller;
  int _currentSelection = 0;
  int _currentSelection1 = 0;
  int _currentValue = 0;

  bool selected = false;

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
    String? _selectedLocation;

    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
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
              _controller = _scaffoldKey.currentState!.showBottomSheet(
                (context) {
                  return Container(
                    width: width,
                    height: height * 0.65,
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
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Apply",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.blue),
                                ))
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
                            onSegmentChosen: (dynamic index) {
                              setState(() {
                                _currentSelection1 = index;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 12,
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
                                  onChanged: (dynamic newValue) {
                                    _controller.setState!(() {
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
                          height: 12,
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
                          height: 12,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        "assets/2.png",
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
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset("assets/3.jpeg",
                                          fit: BoxFit.scaleDown),
                                    ),
                                    Text(
                                      "Land",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        "assets/4.jpg",
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                    Text(
                                      "Renthouse",
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        "assets/5.png",
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      "Village",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
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
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
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
                          ),
                        ),
                        SizedBox(
                          height: 12,
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
                                        blurRadius: 1.0,
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    border: Border.all(color: Colors.white10),
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Icon(
                                  Icons.attach_money_rounded,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Text(
                              "Price Range",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Text(
                                      "\<500 ",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 18),
                                    ),

                                    Radio(
                                        value: 0,
                                        groupValue: _currentValue,
                                        activeColor: Colors.purple,
                                        onChanged: (value) {
                                          _controller.setState!(() {
                                            _currentValue = value as int;
                                          });
                                        }),
                                    // CircularCheckBox(
                                    //     value: this.selected,
                                    //     checkColor: Colors.white,
                                    //     activeColor: Colors.blue,
                                    //     inactiveColor: Colors.black54,
                                    //     disabledColor: Colors.grey,
                                    //     onChanged: (val) => this.setState(() {
                                    //           this.selected = !this.selected;
                                    //         })),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Text(
                                      "\<1000",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 18),
                                    ),
                                    Radio(
                                        value: 1,
                                        groupValue: _currentValue,
                                        activeColor: Colors.purple,
                                        onChanged: (value) {
                                          _controller.setState!(() {
                                            _currentValue = value as int;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Text(
                                      "\<1500",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 18),
                                    ),
                                    Radio(
                                        value: 2,
                                        groupValue: _currentValue,
                                        activeColor: Colors.purple,
                                        onChanged: (value) {
                                          _controller.setState!(() {
                                            _currentValue = value as int;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Text(
                                      "\<2000",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 18),
                                    ),
                                    Radio(
                                        value: 3,
                                        groupValue: _currentValue,
                                        activeColor: Colors.purple,
                                        onChanged: (value) {
                                          _controller.setState!(() {
                                            _currentValue = value as int;
                                          });
                                          _controller.setState!(() {});
                                        }),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              );
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
              onSegmentChosen: (dynamic index) {
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
