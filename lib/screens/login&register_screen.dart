import 'package:flutter/material.dart';
import '../Services/sign_In_screen.dart';
import '../Services/sign_up_screen.dart';
import '../components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static const id = '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
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
                  title: 'Login',
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignInScreen.id);
                  },
                ),
              ),
              Container(
                height: 100,
                child: RoundedButton(
                  title: 'Register',
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignUpScreen.id);
                    //Go to login screen.
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
