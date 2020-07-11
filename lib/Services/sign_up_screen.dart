import 'package:flutter/material.dart';
import 'package:wedding_planner/Services/auth.dart';
import 'package:wedding_planner/loading.dart';
import 'package:wedding_planner/screens/home_screen.dart';
import 'package:wedding_planner/screens/wedding_day_screen.dart';
import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  static const id = '/register_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _auth = AuthService();

  bool spinner = false;
  String email = '';
  String password = '';
  String error = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return spinner
        ? Loading()
        : WillPopScope(
            onWillPop: () async {
              Navigator.pop(context);
              return false;
            },
            child: Scaffold(
              appBar: AppBar(
                elevation: 0.0,
              ),
              backgroundColor: Theme.of(context).primaryColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Column(
                          children: <Widget>[
                            Container(
                              child:
                                  Image.asset('assets/images/welcome_logo.png'),
                              height: 190,
                            ),
                            Center(
                              child: Text(
                                'Wedding Planner',
                                style: TextStyle(
                                  fontSize: 35.0,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .title
                                      .fontFamily,
                                  fontWeight: FontWeight.w900,
                                  color:
                                      Theme.of(context).textTheme.body1.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 48.0,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 350,
                              child: TextFormField(
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ),
                                validator: (emailValue) => emailValue.isEmpty
                                    ? 'Enter an email'
                                    : null,
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.center,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter your email',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).accentColor),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                ),
                                onChanged: (emailValue) {
                                  setState(() => email = emailValue);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 450,
                              child: TextFormField(
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ),
                                validator: (passValue) => passValue.length < 6
                                    ? 'Enter a password 6+ chars long'
                                    : null,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter your password',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).accentColor),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                ),
                                obscureText: true,
                                textAlign: TextAlign.center,
                                onChanged: (passValue) {
                                  setState(() => password = passValue);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
//                              Container(
//                                width: 120,
//                                height: 50,
//                                child: RaisedButton(
//                                  child: Text('Back'),
//                                  color: Theme.of(context).primaryColor,
//                                  textColor: Theme.of(context).accentColor,
//                                  elevation: 7,
//                                  onPressed: () {
//                                    Navigator.popAndPushNamed(
//                                        context, WelcomeScreen.id);
//                                  },
//                                ),
//                              ),
//                              SizedBox(
//                                width: 15,
//                              ),
                                Container(
                                  width: 120,
                                  height: 50,
                                  child: RaisedButton(
                                    child: Text('Register'),
                                    color: Theme.of(context).accentColor,
                                    textColor: Theme.of(context).primaryColor,
                                    elevation: 7,
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() => spinner = true);
                                        dynamic result = await _auth
                                            .registerWithEmailAndPassword(
                                                email, password);
                                        if (result == null) {
                                          setState(() {
                                            error =
                                                'Please supply a valid email';
                                            spinner = false;
                                            return null;
                                          });
                                        } else {
                                          Navigator.of(context)
                                              .popAndPushNamed(WeddingDay.id);
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Center(
                              child: Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
