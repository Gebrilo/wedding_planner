import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wedding_planner/Services/auth.dart';
import 'package:wedding_planner/model/data_info.dart';
import 'package:wedding_planner/screens/splash_screen.dart';
import 'package:wedding_planner/screens/welcome_screen.dart';
import 'category_screen.dart';
import '../widgets/drawer_item.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomeScreen extends StatefulWidget {
  static const id = '/home_screen';

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  Data data = Data();

  String _usersName = "";

  @override
  void initState() {
    data.getUserName().then(updateName);
    super.initState();
  }

  void updateName(String name) {
    setState(() {
      this._usersName = name;
    });
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Welcome $_usersName'),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.person,
                  color: Theme.of(context).accentColor,
                ),
                label: Text(
                  'logout',
                  style:
                      TextStyle(color: Theme.of(context).textTheme.body1.color),
                ),
                onPressed: () async {
                  await _auth.signOut();
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.clear();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  );
                },
              ),
            ],
          ),
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/back_ground.jpg"),
                fit: BoxFit.cover,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CarouselSlider(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                              horizontal: 3.0,
                              vertical: 3.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Image.asset(
                              'assets/images/$i.jpeg',
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Expanded(child: CategoryScreen()),
                ],
              )),
          drawer: SideMenu(),
        ),
      ),
    );
  }
}
