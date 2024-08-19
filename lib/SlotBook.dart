import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:aps/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:aps/SecondScreen.dart';
import 'package:aps/database.dart';
import 'package:aps/AddVehicle.dart';
import 'package:aps/MainPage.dart';
import 'package:aps/Slot.dart';

class SlotBook extends StatefulWidget {
  const SlotBook({super.key});

  @override
  State<SlotBook> createState() => _SlotBookState();
}

class _SlotBookState extends State<SlotBook> {
  DateTime? dateTime;
  DateTime? time;
  String selectedVehicle = 'Choose Vehicle';
  String selectedDuration = 'Select Duration';

  final List<String> vehicles = currentUser.listCars();
  var amt = {'0hr 30min' : 8.0,
    '1hr 00min' : 10.0,
    '1hr 30min' : 15.0,
    '2hr 00min' : 20.0,
    '2hr 30min' : 25.0,
    '3hr 00min' : 30.0,
    '4hr 00min' : 38.0};
  final List<String> durations = [
    'Select Duration',
    '0hr 30min',
    '1hr 00min',
    '1hr 30min',
    '2hr 00min',
    '2hr 30min',
    '3hr 00min',
    '4hr 00min'
  ];

  @override
  void initState() {
    super.initState();
    vehicles.insert(0,'Choose Vehicle');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Book Slot')),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: DropdownButton<String>(
                value: selectedVehicle,
                hint: Text('Choose Vehicle'),
                items: vehicles.map((String vehicle) {
                  return DropdownMenuItem<String>(
                    value: vehicle,
                    child: Text(vehicle),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedVehicle = value ?? 'Choose Vehicle';
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: DropdownButton<String>(
                value: selectedDuration,
                hint: Text('Select Duration'),
                items: durations.map((String duration) {
                  return DropdownMenuItem<String>(
                    value: duration,
                    child: Text(duration),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedDuration = value ?? '0hr 30min';
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: CupertinoButton(
                child: const Text('Choose Date'),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        backgroundColor: Colors.white,
                        minimumDate: DateTime.now(),
                        maximumYear: 2024,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() {
                            dateTime = newTime;
                          });
                        },
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.date,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Visibility(
                    child: Text(
                        "Chosen date: ${dateTime?.day}/${dateTime?.month}/${dateTime?.year}"),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: dateTime != null,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: CupertinoButton(
                child: const Text('Choose Time'),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        backgroundColor: Colors.white,
                        minimumDate: DateTime.now(),
                        maximumYear: 2024,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() {
                            time = newTime;
                          });
                        },
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.time,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Visibility(
                    child: Text("Chosen time: ${time?.hour}:${time?.minute}"),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: time != null,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  minimumSize: Size(100, 40),
                ),
                onPressed: () {
                  if(selectedVehicle != 'Choose Vehicle' && selectedDuration != 'Select Duration' && dateTime != null && time != null) {
                    
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Slot(amount: amt[selectedDuration] ?? 0.0,index : currentUser.getCarIndex(selectedVehicle)),));
                  }

                },
                child: Text('Book'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}