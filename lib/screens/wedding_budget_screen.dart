import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:wedding_planner/Services/auth.dart';
import 'package:wedding_planner/Services/database.dart';
import 'package:wedding_planner/model/user.dart';
import '../model/data_info.dart';
import 'package:wedding_planner/screens/home_screen.dart';

class WeddingBudget extends StatefulWidget {
  static String id = '/wedding_budget_screen';

  @override
  _WeddingBudgetState createState() => _WeddingBudgetState();
}

class _WeddingBudgetState extends State<WeddingBudget> {
  final budgetAmount = TextEditingController();
  Data bg = Data();
  DatabaseService db = DatabaseService();
  String userName = "";
  String weddingDay = "";
  void initState() {
    bg.getUserName().then(updateName);
    bg.getDate().then(updatedate);

    super.initState();
  }

  void updateName(String name) {
    setState(() {
      this.userName = name;
    });
  }

  void updatedate(String name) {
    setState(() {
      this.weddingDay = name;
    });
  }

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Our wedding budget',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.body1.fontFamily,
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Center(
                      child: Container(
                        child: Image.asset(
                          'assets/images/budget.png',
                          height: 250,
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      child: TextField(
                        style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color,
                            fontSize: 25),
                        controller: budgetAmount,
                        onSubmitted: (newValue) async {
                          bg.saveBudget(int.parse(newValue));

                          if (user.uid == null) {
                            Navigator.of(context)
                                .popAndPushNamed(MyHomeScreen.id);
                            print('error');
                          } else {
                            await DatabaseService(uid: user.uid).updateUserData(
                                await bg.getUserName(),
                                await bg.getDate(),
                                await bg.getBudget(),
                                01000);
                          }
                          // ignore: missing_return
                          setState(() {
                            if (int.parse(newValue) < 9999) {
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                          'the budget have to be more than 10000'),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'close',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomeScreen()),
                              );
                            }
                          });
                        },
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: const InputDecoration(
                          suffixText: 'EGP',
                          suffixStyle:
                              TextStyle(fontSize: 20, color: Colors.amber),
                          suffixIcon: Icon(Icons.edit, color: Colors.amber),
                        ),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
