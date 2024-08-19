import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:aps/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:aps/SecondScreen.dart';
import 'package:aps/database.dart';
import 'package:aps/AddVehicle.dart';
import 'package:aps/MainPage.dart';
import 'package:aps/my_flutter_app_icons.dart';
import 'package:aps/PaymentPage2.dart';
import 'package:aps/PaymentPage.dart';
import 'package:aps/PaymentPage3.dart';


class Slot extends StatefulWidget {
  final double amount;
  final int index;
  const Slot({required this.amount,required this.index});

  @override
  State<Slot> createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  String SlotSelected = "";
  late List carA;
  late List carB;
  late List carC;
  late List carD;
  void setCarSlots() {
    carA = List.filled(6, Colors.black);
    carB = List.filled(6, Colors.black);
    carC = List.filled(6, Colors.black);
    carD = List.filled(6, Colors.black);

    for (int i = 0; i < 6; i++) {
      if (carSlots[0][i]) {
        carA[i] = Colors.red;
      }
      if (carSlots[1][i]) {
        carB[i] = Colors.red;
      }
      if (carSlots[2][i]) {
        carC[i] = Colors.red;
      }
      if (carSlots[3][i]) {
        carD[i] = Colors.red;
      }
    }
  }
  @override
  void initState() {
    super.initState();
    setCarSlots();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#22333b"),
      appBar: AppBar(
        title: Center(child: Text('APS')),
        backgroundColor: Colors.blueGrey[900],),
      body:Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/slot.png'),
                //fit: BoxFit.cover,
              )
          ),
        child: Center(

        child: Column(
         children: [
           Row(
          children: [
            carIcon('A',0),
            carIcon('A',1),
            carIcon('A',2),
            carIcon('A',3),
            carIcon('A',4),
            carIcon('A',5),
          ],
        ),
           Row(
             children: [
               carIcon2('B',0),
               carIcon2('B',1),
               carIcon2('B',2),
               carIcon2('B',3),
               carIcon2('B',4),
               carIcon2('B',5),
             ],
           ),
           Row(
             children: [
               carIcon3('C',0),
               carIcon3('C',1),
               carIcon3('C',2),
               carIcon3('C',3),
               carIcon3('C',4),
               carIcon3('C',5),
             ],
           ),
           Row(
             children: [
               carIcon4('D',0),
               carIcon4('D',1),
               carIcon4('D',2),
               carIcon4('D',3),
               carIcon4('D',4),
               carIcon4('D',5),
             ],
           ),
          ]
        ),
        ),
      ),
      bottomNavigationBar: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.indigo,minimumSize : Size(100, 40)),
          onPressed: ()
          {
            if(SlotSelected != "")
            Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage3(slot: SlotSelected,index: widget.index,amount :widget.amount), ));
            // print('object');
          },
          child: Text('Continue'),
        ),
      ),
    );
  }
  Widget carIcon(String slot,int index)
  {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 70, 0, 100),
      child: IconButton(
        color: Colors.redAccent,
        isSelected: true,
        icon: Icon(MyFlutterApp.car_topview,size: 80,color: carA[index],),
        onPressed: () {
          setState(() {
            if(carA[index] != Colors.red) {
              if (SlotSelected != "") {
                if (SlotSelected[0] == 'A') {
                  carA[int.parse(SlotSelected[1])] = Colors.black;
                }
                else if (SlotSelected[0] == 'B') {
                  carB[int.parse(SlotSelected[1])] = Colors.black;
                }
                else if (SlotSelected[0] == 'C') {
                  carC[int.parse(SlotSelected[1])] = Colors.black;
                }
                else if (SlotSelected[0] == 'D') {
                  carD[int.parse(SlotSelected[1])] = Colors.black;
                }
              }
              SlotSelected = slot + index.toString();
              carA[index] = Colors.green;
            }
            //carA.elementAt(index) = Colors.green;
          });

        },
      ),
    );
  }
  Widget carIcon2(String slot,int index)
  {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 0, 90),
      child: IconButton(
        icon: Icon(MyFlutterApp.car_topview,size: 80,color: carB[index],),
        onPressed: () {
          setState(() {
  if(carB[index] != Colors.red) {
    if (SlotSelected != "") {
      if (SlotSelected[0] == 'A') {
        carA[int.parse(SlotSelected[1])] = Colors.black;
      }
      else if (SlotSelected[0] == 'B') {
        carB[int.parse(SlotSelected[1])] = Colors.black;
      }
      else if (SlotSelected[0] == 'C') {
        carC[int.parse(SlotSelected[1])] = Colors.black;
      }
      else if (SlotSelected[0] == 'D') {
        carD[int.parse(SlotSelected[1])] = Colors.black;
      }
    }
    SlotSelected = slot + index.toString();
    carB[index] = Colors.green;
  }
          });

        },
      ),
    );
  }
  Widget carIcon3(String slot,int index)
  {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
      child: IconButton(

        icon: Icon(MyFlutterApp.car_topview,size: 80,color: carC[index]),
        onPressed: () {
          setState(() {
  if(carC[index] != Colors.red) {
    if (SlotSelected != "") {
      if (SlotSelected[0] == 'A') {
        carA[int.parse(SlotSelected[1])] = Colors.black;
      }
      else if (SlotSelected[0] == 'B') {
        carB[int.parse(SlotSelected[1])] = Colors.black;
      }
      else if (SlotSelected[0] == 'C') {
        carC[int.parse(SlotSelected[1])] = Colors.black;
      }
      else if (SlotSelected[0] == 'D') {
        carD[int.parse(SlotSelected[1])] = Colors.black;
      }
    }
    SlotSelected = slot + index.toString();
    carC[index] = Colors.green;
  }
          });

        },
      ),
    );
  }
  Widget carIcon4(String slot,int index)
  {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 80, 0, 0),
      child: IconButton(

        icon: Icon(MyFlutterApp.car_topview,size: 80,color: carD[index]),
        onPressed: () {
          setState(() {
            if(carD[index] != Colors.red) {
              if (SlotSelected != "") {
                if (SlotSelected[0] == 'A') {
                  carA[int.parse(SlotSelected[1])] = Colors.black;
                }
                else if (SlotSelected[0] == 'B') {
                  carB[int.parse(SlotSelected[1])] = Colors.black;
                }
                else if (SlotSelected[0] == 'C') {
                  carC[int.parse(SlotSelected[1])] = Colors.black;
                }
                else if (SlotSelected[0] == 'D') {
                  carD[int.parse(SlotSelected[1])] = Colors.black;
                }
              }
              SlotSelected = slot + index.toString();
              carD[index] = Colors.green;
            }
          });

        },
      ),
    );
  }
}