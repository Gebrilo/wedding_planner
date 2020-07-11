import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:wedding_planner/loading.dart';
import 'package:wedding_planner/screens/wedding_budget_screen.dart';
import '../constants.dart';
import '../model/data_info.dart';

class WeddingDay extends StatefulWidget {
  static String id = '/wedding_day_screen';

  @override
  _WeddingDayState createState() => _WeddingDayState();
}

class _WeddingDayState extends State<WeddingDay> {
  DateTime _selectedDate = DateTime.now();
  DateTime date;
  bool spinner = false;

  Data date1 = Data();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2019),
      lastDate: DateTime(2090),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.amber,
          ),
          child: child,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        date = _selectedDate;
        String z = DateFormat("MMM-d-y").format(date);
        date1.saveDate(z);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Our wedding date',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Image.asset(
                        'assets/images/calender.png',
                        height: 250,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => _selectDate(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${DateFormat("d - M - y").format(_selectedDate)}",
                          style: TextStyle(
                            fontFamily:
                                Theme.of(context).textTheme.body1.fontFamily,
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                            color: Theme.of(context).textTheme.body1.color,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              color: kTextColorM,
                              borderRadius: BorderRadius.circular(25)),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  FlatButton(
                    child: Text('Set Budget'),
                    textColor: Theme.of(context).textTheme.body1.color,
                    onPressed: () {
                      setState(() => spinner = true);
                      Navigator.of(context).popAndPushNamed(WeddingBudget.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
