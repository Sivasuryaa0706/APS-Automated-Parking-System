import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:aps/SecondScreen.dart';
import 'package:aps/Register.dart';

class SecondFileLoginorSignup extends StatefulWidget {
  const SecondFileLoginorSignup({super.key});

  @override
  State<SecondFileLoginorSignup> createState() => _SecondFileLoginorSignupState();
}

class _SecondFileLoginorSignupState extends State<SecondFileLoginorSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Hey👋",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You are just a step away",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700], fontSize: 17),
                    )
                  ],
                ),
                Container(
                  child: Lottie.network(
                      'https://lottie.host/18c8eb0b-448e-4b49-a1fa-ed6f6193321e/PhCKQdehC8.json'),
                ),
                Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SecondScreen()  , ));
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()  , ));
                      },
                      color: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
