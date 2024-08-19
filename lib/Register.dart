import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aps/Person.dart';
import 'package:aps/database.dart';
import 'package:aps/main.dart';
import 'SecondScreen.dart';
import 'MainPage.dart';
import 'package:aps/Otpscreen.dart';


class Register extends StatefulWidget {

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();

}

class _RegisterState extends State<Register> {
  final auth = FirebaseAuth.instance;
  String name = "";

  String pass = "";
  String confirmPass = "";


  TextEditingController phoneNumber = TextEditingController();
  bool visible = false;
  var temp;




/*
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        // authentication successful, do something
        Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder: (context) => MainPage(),));
      },
      verificationFailed: (FirebaseAuthException e) {
        // authentication failed, do something
        Navigator.pushReplacement(context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(),));
      },
      codeSent: (String verificationId, int? resendToken) async {
        // code sent to phone number, save verificationId for later use

        );
        //Get.to(SecondScreen(), arguments: [verificationId]);
        await auth.signInWithCredential(credential);
        // authentication successful, do something
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

*/




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#22333b"),
      appBar: AppBar(
        title: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: Center(child: Text('APS'))),
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
                  height: 580.0,
                  padding: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white38, //white54
                  ),
                  child : Center(child : Column(
                      children : <Widget> [
                        Text('Register',
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
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: Colors.greenAccent,
                                //color : myFocusNode.hasFocus ? Colors.blue : Colors.black
                              ),
                              filled: true,
                              fillColor: Colors.blueGrey[900],
                            ),
                            onChanged: (val) {
                              setState(() {
                                name = val;
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
                              labelText: 'Mobile. no',
                              labelStyle: TextStyle(
                                  color: Colors.greenAccent
                              ),
                              filled: true,
                              fillColor: Colors.blueGrey[900],
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                            onChanged: (val) {
                              setState(() {
                                phoneNumber.text = val;
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
                              fillColor: Colors.blueGrey[900],
                            ),
                            onChanged: (val) {
                              setState(() {
                                pass = val;
                              });
                            },
                            obscureText: true,
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
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(
                                  color: Colors.greenAccent
                              ),
                              filled: true,
                              fillColor: Colors.blueGrey[900],
                            ),
                            onChanged: (val) {
                              setState(() {
                                confirmPass = val;
                              });
                            },
                            obscureText: true,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.indigo,minimumSize : Size(100, 40)),

                              onPressed: () async{
                                if(name != "" && phoneNumber.text != "" && pass != "" && pass == confirmPass) {
                                  Person $temp = new Person(name, phoneNumber.text, pass);
                                  addPerson($temp);




                                  Navigator.push(context,
                                      MaterialPageRoute(
                                        builder: (context) => Otpscreen(phoneNumber: "+91"+phoneNumber.text),));

                                  // print('object');
                                }
                              },
                              child: Text('Register')
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
