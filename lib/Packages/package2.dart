import 'package:flutter/material.dart';

class Package2 extends StatefulWidget {
  static const String id = '/package2';

  @override
  _Package2State createState() => _Package2State();
}

class _Package2State extends State<Package2> {
  Map<String, String> values = {
    '10 Tables & 100 Chairs': 'EGP 7000 to 8000',
    '10 Centerpieces': 'EGP 2000 to 3000',
    'Kosha': 'EGP 1800 to 2500',
    'DJ': 'EGP 3500 to 4000',
    'Dance Floor': 'EGP 2500 to 3500',
    'Lights': 'EGP 2500 to 3000',
    'Entrance': 'EGP 2500 to 3000',
    'Backdrop' : 'EGP 2500 to 3000',
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffa7c0d8),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 330,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xff0081ff),
              ),
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    'PACKAGE 2',
                    style: TextStyle(
                      fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
            ),
            Divider(height: 5),
            Card(
              elevation: 2,
              child: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text('Total',
                    style: TextStyle(
                      color: Color(0xff70b8ff),
                      fontSize: 20,
                      fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                    ),
                  ), trailing: Text('24000 to 30000 LE',
                  style: TextStyle(
                    color: Color(0xff70b8ff),
                    fontSize: 20,
                    fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                  ),
                ),
                ),
              ),
            ),
            Divider(height: 5),
            Expanded(
              child: ListView(
                children: values.keys.map((String key) {
                  return Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xff70b8ff),
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        key,
                        style: TextStyle(
                          color: Color(0xff70b8ff),
                        ),
                      ),
                      trailing: Text(
                        values[key],
                        style: TextStyle(
                          color: Color(0xff70b8ff),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
