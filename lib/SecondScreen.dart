import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aps/MainPage.dart';
import 'package:aps/database.dart';
import 'package:aps/main.dart';
import 'package:aps/Register.dart';


class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String ph = "";
  String pass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#22333b"),
      appBar: AppBar(
        title: Center(child: Text('APS')),
        backgroundColor: Colors.blueGrey[900],),

      body:Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login_img.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: Center(

              child: Container(
                  height: 450.0,
                  padding: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white38, //white54
                  ),
                  child : Center(child : Column(
                      children : <Widget> [
                        Text('Login',
                            textAlign: TextAlign.center
                            ,style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            )
                        ),

                        Container(
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),

                          child: TextField(
                            style: TextStyle(
                                color: Colors.white
                            ),



                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Mobile no.',

                              labelStyle: TextStyle(
                                color: Colors.greenAccent,
                                //color : myFocusNode.hasFocus ? Colors.blue : Colors.black
                              ),
                              filled: true,
                              fillColor: Colors.blueGrey[800],
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                            onChanged: (val) {
                              setState(() {
                                ph = val;
                              });
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.white
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.greenAccent
                              ),
                              filled: true,
                              fillColor: Colors.blueGrey[800],
                            ),
                            obscureText: true,
                            onChanged: (val) {
                              setState(() {
                                pass = val;
                              });
                            },
                          ),
                        ),

                        Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.black,minimumSize : Size(100, 40)),

                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register()  , ));
                                      // print('object');
                                    },
                                    child: Text('Register')
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(112, 30, 0, 0),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.indigo,minimumSize : Size(100, 40)),

                                    onPressed: (){
                                      if(loginUser(ph, pass)) {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MainPage(),));
                                      }
                                      else{

                                      }
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()  , ));
                                      // print('object');
                                    },
                                    child: Text('Login')
                                ),
                              ),
                            ],
                          ),
                        )
                      ]
                  )
                  )
              ))
      ),

    );
  }
}

