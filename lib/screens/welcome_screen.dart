import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_planner/Services/auth.dart';
import 'package:wedding_planner/loading.dart';
import 'package:wedding_planner/model/user.dart';
import 'package:wedding_planner/screens/home_screen.dart';
import 'package:wedding_planner/screens/login&register_screen.dart';
import 'package:wedding_planner/screens/wedding_day_screen.dart';
import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = '/welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final AuthService _auth = AuthService();

  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    return spinner
        ? Loading()
        : Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image.asset('assets/images/welcome_logo.png'),
                          height: 190,
                        ),
                        Center(
                          child: Text(
                            'Wedding Planner',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontFamily:
                                  Theme.of(context).textTheme.title.fontFamily,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).textTheme.body1.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Container(
                    height: 100,
                    child: RoundedButton(
                      title: 'set up your wedding',
                      onPressed: () async {
                        setState(() {
                          spinner = true;
                        });
                        dynamic result = await _auth.signInAnon();
                        if (result == null) {
                          print('error');
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeddingDay()),
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    child: RoundedButton(
                      title: 'Log into existing',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                        //Go to login screen.
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
