import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:aps/SecondScreen.dart';
import 'package:aps/main.dart';
import 'package:aps/firebase_options.dart';
import 'package:aps/MainPage.dart';
import 'package:aps/Car.dart';
import 'package:aps/database.dart';


class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  String? _selectedValue;
  String? _selectedStatus;
  String _name = "";
  String _carno = "";
  List listItem = ["2 wheeler", "4 wheeler"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Add vehicle')),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
                child: Column(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Vehicle Name',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey[900],
                          //color : myFocusNode.hasFocus ? Colors.blue : Colors.black
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (val) {
                        setState(() {
                          _name = val;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Vehicle No',
                        labelStyle: TextStyle(color: Colors.blueGrey[900]),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (val) {
                        setState(() {
                          _carno = val;
                        });
                      },
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            hint: Text('Vehicle Type'),
                            style: TextStyle(
                              color: Colors.blueGrey[900],
                            ),
                            value: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                  child: Text("2 wheeler",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16)),
                                  value: "2 wheeler"),
                              DropdownMenuItem(
                                  child: Text("4 wheeler",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16)),
                                  value: "4 wheeler"),
                            ],
                          ))),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            hint: Text('Status',
                                style: TextStyle(
                                    color: Colors.blueGrey[900], fontSize: 16)),
                            value: _selectedStatus,
                            onChanged: (value) {
                              setState(() {
                                _selectedStatus = value;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                  child: Text("Rent",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16)),
                                  value: "Rent"),
                              DropdownMenuItem(
                                  child: Text("Owned",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16)),
                                  value: "Owned"),
                            ],
                          ))),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.indigo, minimumSize: Size(100, 40)),
                        onPressed: () {
                          if (_name != "" &&
                              _carno != "" &&
                              _selectedStatus != "" &&
                              _selectedValue != "") {
                            Car newcar = new Car(
                                _name.toString(),
                                _carno.toString(),
                                _selectedValue.toString(),
                                _selectedStatus.toString());
                            currentUser.addcar(newcar);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(),
                                ));
                          }
                        },

                        // print('object');
                        // },
                        child: Text('ADD', style: TextStyle(color: Colors.white)),
                      ))
                ])),
          ),
        ));
  }
}
