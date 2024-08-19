import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aps/Person.dart';
import 'package:aps/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aps/main.dart';
import 'package:pinput/pinput.dart';
import 'package:aps/Register.dart';
import 'MainPage.dart';
import 'package:aps/SecondScreen.dart';

class Otpscreen extends StatefulWidget {
  final String phoneNumber;

  const Otpscreen({required this.phoneNumber});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {

  String otpCode = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  late String verificationId;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code ==
            'invalid-phone-number') {
          print(
              'The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code

        setState(() {
          this.verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieval timeout, called if the auto-retrieval times out.
      },
    );
  }
  void signInWithPhoneNumber(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      UserCredential userCredential = await auth.signInWithCredential(credential);
      // Handle signed in user
      print("Manually entered verification code. User: ${userCredential.user}");
      if (userCredential.user != null) {
        // Navigate to the next page
       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SecondScreen()),;
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } catch (e) {
      print("Error signing in: $e");
      // Handle sign-in error
    }
  }

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber(widget.phoneNumber);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#22333b"),
      appBar: AppBar(
        title: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: Center(child: Text('APS'))),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login_img.jpg'),
                fit: BoxFit.cover,
              )),
          child: Center(
              child: Container(
                  height: 580.0,
                  padding: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white38, //white54
                  ),
                  child: Center(
                      child: Column(children: <Widget>[
                        Text('OTP Verification',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            )),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 50),
                          child: Text(
                            'OTP successfully sent to Registered Mobile no.',
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        Pinput(
                          length: 6,
                          showCursor: true,

                          defaultPinTheme: PinTheme(
                            width: 70,
                            height: 70,
                            textStyle: TextStyle(
                              color: Colors.white,

                            ),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black),
                              color: Colors.blueGrey[900]
                            )
                          ),
                          onCompleted: (value){
                            setState(() {
                              otpCode = value ;
                            });
                          },
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.indigo,minimumSize : Size(100, 40)),
                            child: Text('Submit'),
                            onPressed: (){
                              if(otpCode != null)
                                {
                                    signInWithPhoneNumber(otpCode);
                                }
                              else{
                              }
                            },
                          ),
                        )
                      ]))))),
    );
  }
}
