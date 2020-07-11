import 'package:flutter/material.dart';
import 'package:wedding_planner/Services/auth.dart';
import 'package:wedding_planner/loading.dart';
import '../screens/home_screen.dart';
import '../screens/welcome_screen.dart';
import '../constants.dart';

class SignInScreen extends StatefulWidget {
  static const id = '/sign_In_screen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
              body: SingleChildScrollView(
                child: Padding(
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
                                Container(
                                  width: 120,
                                  height: 50,
                                  child: RaisedButton(
                                    child: Text('Log In'),
                                    color: Theme.of(context).accentColor,
                                    textColor: Theme.of(context).primaryColor,
                                    elevation: 7,
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() => spinner = true);
                                        dynamic result = await _auth
                                            .signInWithEmailAndPassword(
                                                email, password);

                                        if (result == null) {
                                          setState(() {
                                            error =
                                                'could not sign in with those cedentials';
                                            spinner = false;
                                            return null;
                                          });
                                        } else {
                                          Navigator.of(context)
                                              .popAndPushNamed(MyHomeScreen.id);
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
                            Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
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
