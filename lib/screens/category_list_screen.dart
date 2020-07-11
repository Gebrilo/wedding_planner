import 'package:flutter/material.dart';
import '../Packages/package1.dart';
import '../Packages/package2.dart';
import '../Packages/package3.dart';
import '../widgets/submit_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryList extends StatefulWidget {
  static const String id = '/category_list_screen';

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: Scaffold(
          backgroundColor: Color(0xffa7c0d8),
          appBar: AppBar(
            backgroundColor: Color(0xff0081ff),
            centerTitle: true,
            title: Text(
              'CATEGORY',
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Divider(height: 9),
              Card(
                elevation: 5,
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: FlatButton(
                    child: Text(
                      'Pacakge (1)',
                      style: TextStyle(
                          color: Color(0xff70b8ff),
                          fontSize: 25,
                          fontFamily:
                              Theme.of(context).textTheme.body1.fontFamily,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Package1.id);
                    },
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: FlatButton(
                    child: Text(
                      'Pacakge (2)',
                      style: TextStyle(
                          color: Color(0xff70b8ff),
                          fontSize: 25,
                          fontFamily:
                              Theme.of(context).textTheme.body1.fontFamily,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Package2.id);
                    },
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: FlatButton(
                    child: Text(
                      'Pacakge (3)',
                      style: TextStyle(
                          color: Color(0xff70b8ff),
                          fontSize: 25,
                          fontFamily:
                              Theme.of(context).textTheme.body1.fontFamily,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Package3.id);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
