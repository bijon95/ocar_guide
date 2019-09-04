import 'dart:async';

import 'package:flutter/material.dart';
import 'homeScreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new MyApp()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: new ExactAssetImage('images/splash.jpg'),
          fit: BoxFit.cover)
        ),
       // child: new Image.asset('images/splashscreen.jpg',fit: BoxFit.cover,),
      ),
    );
  }
}
