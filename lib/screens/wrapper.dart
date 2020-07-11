import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_planner/screens/home_screen.dart';
import 'package:wedding_planner/screens/welcome_screen.dart';
import '../model/user.dart';



class Wrapper extends StatelessWidget {

  final Widget screen;
  Wrapper({this.screen});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return WelcomeScreen();
    } else {
      return MyHomeScreen();
    }
  }
}
