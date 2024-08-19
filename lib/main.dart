import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:aps/SecondScreen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:aps/firebase_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aps/SecondFileLoginorSignup.dart';



class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage()));
}
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Lottie.network(
                    'https://lottie.host/16b1318f-5ed1-4766-afe5-d25dc0f5adfd/0TugWGOqzj.json'),
              ),
              Text(
                "Welcome to APS",
                style: GoogleFonts.montserrat(fontSize: 30),
              ),
              Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SlideAction(
                      borderRadius: 12,
                      elevation: 0,
                      innerColor: Colors.deepPurple,
                      outerColor: Colors.deepPurple[200],
                      sliderButtonIcon: const Icon(
                        Icons.car_rental,
                        color: Colors.white,
                      ),
                      text: 'Slide to get started',
                      textStyle:
                      GoogleFonts.poppins(fontSize: 22, color: Colors.white),
                      sliderRotate: false,
                      onSubmit: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SecondFileLoginorSignup()),
                        );
                        //Do something (Link next page)
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class APS extends StatelessWidget {
  const APS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: FirstPage()
      ),
      bottomNavigationBar: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.indigo,minimumSize : Size(100, 40)),

          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SecondScreen()  , ));
            // print('object');
          },
          child: Text('Get Started >>'),
        ),
      ),



    );
  }
}
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.all(35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white54, //white54
            ),
            child: Text('Welcome to APS\nKeep calm and Park the Vehicle',
                textAlign: TextAlign.center
                ,style: TextStyle(color: HexColor("#3d0c02"),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )
            )));
  }
}




