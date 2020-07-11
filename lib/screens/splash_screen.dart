import 'package:flutter/material.dart';
import 'dart:async';
import 'gender_screen.dart';


class SplashScreen extends StatefulWidget {
  static String id = '/splash_screen';
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => GenderScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/splash_screen.jpeg'),
            fit: BoxFit.cover),
      ),
    );
  }
}
