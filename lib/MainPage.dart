import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:aps/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:aps/SecondScreen.dart';
import 'package:aps/database.dart';
import 'package:aps/AddVehicle.dart';
import 'package:aps/SlotBook.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late BuildContext _context;


  @override
  Widget build(BuildContext context) {
    final tabs = [
      Scaffold(
        body: Center(
                      child: Column(
                        children : [
                          Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            margin: EdgeInsets.fromLTRB(120, 20, 120, 20),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddVehicle()));
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()  , ));
                          },
                          color: Colors.deepPurple,
                          // color: Colors.blueGrey.shade800,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            "Add vehicle",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        // child: ElevatedButton(
                        //   style: ElevatedButton.styleFrom(primary: Colors.indigo,minimumSize : Size(100, 40)),
                        //   child: Text('Add Vehicle'),
                        //   onPressed: (){
                        //     Navigator.push(context, MaterialPageRoute(builder: (context) => AddVehicle()));
                        //   },
                        // ),
                      ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            margin: EdgeInsets.fromLTRB(120, 20, 120, 20),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SlotBook()));
                                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()  , ));
                              },
                              color: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(
                                "Book Slot",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            // child: ElevatedButton(
                            //   style: ElevatedButton.styleFrom(primary: Colors.indigo,minimumSize : Size(100, 40)),
                            //   child: Text('Book Slot'),
                            //   onPressed: (){
                            //     Navigator.push(context, MaterialPageRoute(builder: (context) => SlotBook()));
                            //   },
                            // ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                            child: Text("Active Parking",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,

                            ),),

                          ),
                          if(currentUser.getActiveCars() == 0)
                            Container(
                              padding: EdgeInsets.all(80),
                            child: Text("You have No Active Parking."),)
                          else
                          for (int i = 0; i < currentUser.getActiveCars(); i++)
                            Column(
                              children: [
                                SizedBox(height: 25),
                                itemActiveHistory(i,
                                  currentUser.getActiveCarAtIndex(i).getcarNo(),
                                  currentUser.getActiveCarAtIndex(i).subtitle(),
                                  currentUser.getActiveCarAtIndex(i).getSlot(),
                                  currentUser.getActiveCarAtIndex(i).getAmount(),
                                  CupertinoIcons.car_detailed,
                                ),
                              ],
                            ),

                        ]
                    ),
        )

                  ),
    Scaffold(
    body: Center(
    child: Padding(
    padding: const EdgeInsets.all(25),
    child: Column(
    children: [
      if(currentUser.getHistoryCars() == 0)
        Container(
          padding: EdgeInsets.all(80),
          child: Text("History is not Available."),)
      else
      for (int i = currentUser.getHistoryCars()-1; i >=0 ; i--)
        Column(
          children: [
            SizedBox(height: 25),
            itemHistory(
              currentUser.getHistoryCarAtIndex(i).getcarNo(),
              currentUser.getHistoryCarAtIndex(i).subtitle(),
              currentUser.getHistoryCarAtIndex(i).getSlot(),
              currentUser.getHistoryCarAtIndex(i).getAmount(),
              CupertinoIcons.car_detailed,
            ),
          ],
        ),
    // SizedBox(
    // height: 25,
    // ),
    // itemHistory('TN 77 K 2223', 'Swift Dzire\n05-11-2023\n02:56:03',
    // CupertinoIcons.car_detailed),
    // SizedBox(
    // height: 25,
    // ),
    // itemHistory(
    // 'TN 77 K 2223', 'Swift Dzire', CupertinoIcons.car_detailed),
    ],
    ),
    ),
    ),
    ),
      Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                itemProfile('Name', currentUser.getName(), CupertinoIcons.person),
                SizedBox(
                  height: 10,
                ),
                itemProfile(
                  'Ph No',
                  currentUser.getPhno(),
                  CupertinoIcons.phone,
                ),
                SizedBox(
                  height: 10,
                ),
                itemProfile('No of vehicles', currentUser.getCars().toString(), CupertinoIcons.car),
                SizedBox(
                  height: 10,
                ),
                itemProfile('Active parking: ', currentUser.getActiveCars().toString(), CupertinoIcons.car_detailed),
                // Container(
                //   padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                //   child: ElevatedButton(
                //       onPressed: () {},
                //       style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
                //       child: Text('Edit Profile')),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  margin: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SecondScreen()));
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()  , ));
                    },
                    color: Colors.deepPurple,
                    // color: Colors.blueGrey.shade800,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // child: ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => SecondScreen()),
                  //     );
                  //   },
                  //   style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
                  //   child: Text('Logout'),
                  // ),

                )],),)
      ))];
    return Scaffold(
      backgroundColor: HexColor("#22333b"),
      appBar: AppBar(
        title: Center(child: Text('APS')),
        backgroundColor: Colors.blueGrey[900],),

      body: tabs[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.blueGrey.shade900,
        animationDuration: Duration(milliseconds: 400),
        //currentIndex: _currentIndex,
        items: [
          Icon(Icons.home,color: Colors.white,),
          Icon(Icons.history,color: Colors.white,),
          Icon(Icons.person,color: Colors.white,),
          // BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',backgroundColor: Colors.yellow),
          // BottomNavigationBarItem(icon: Icon(Icons.history),label: 'History',backgroundColor: Colors.blue),
          // BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile',backgroundColor: Colors.blue)
        ],
        //New
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

    );
  }


}

Widget itemHistory(String title, String subtitle,String slot,double Amount, IconData iconData) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      // boxShadow: [
      //   BoxShadow(
      //       //offset: Offset(0, 5),
      //       // color: Colors.deepOrange.withOpacity(.2),
      //       //spreadRadius: 5,
      //       blurRadius: 10)
      // ]),
    ),
    child: ListTile(
      title: Text(title + "\nSlot no. " + slot),
      subtitle: Text(subtitle),
      leading: Icon(iconData),
      trailing: Text("₹" + Amount.toString()),

      // tileColor: Colors.white,
    ),
  );
}

Widget itemActiveHistory(int index,String title, String subtitle,String slot,double Amount, IconData iconData) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      // boxShadow: [
      //   BoxShadow(
      //       //offset: Offset(0, 5),
      //       // color: Colors.deepOrange.withOpacity(.2),
      //       //spreadRadius: 5,
      //       blurRadius: 10)
      // ]),
    ),
    child: ListTile(
      title: Text(title + "\nSlot no. " + slot),
      subtitle: Text(subtitle),
      leading: Icon(iconData),
      trailing: Text("₹" + Amount.toString()),
      onLongPress: () {
        currentUser.deActiveCar(currentUser.getActiveCarAtIndex(index));
        freeSlot(slot);
      },
      // tileColor: Colors.white,
    ),
  );
}

Widget itemProfile(String title, String subtitle, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      // boxShadow: [
      //   BoxShadow(
      //       //offset: Offset(0, 5),
      //       // color: Colors.deepOrange.withOpacity(.2),
      //       //spreadRadius: 5,
      //       blurRadius: 10)
      // ]),
    ),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(iconData),
      // trailing: Icon(Icons.arrow_forward, color: Colors.grey),
      // tileColor: Colors.white,
    ),
  );
}