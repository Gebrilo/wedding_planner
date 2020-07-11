import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  static const String id = 'contact_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(0xff91bd3a),
            centerTitle: true,
            title: Text(
              'Contact-Us',
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Divider(height: 1),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          height: 50,
                          child: FlatButton(
                            onPressed: () => launch("tel://0114 599 3944"),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Call Us',
                                  style: TextStyle(
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                    height: 30,
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.grey,
                                      size: 32.0,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          height: 50,
                          child: FlatButton(
                            onPressed: () => launch(
                                "https://web.facebook.com/096rsarawedding/"),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'FaceBook',
                                  style: TextStyle(
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  child: Image.asset(
                                    'assets/images/facebook.png',
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          height: 50,
                          child: FlatButton(
                            onPressed: () => launch(
                                "https://www.instagram.com/sarah_eventsplanner_wedding/"),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Instagram',
                                  style: TextStyle(
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  child: Image.asset(
                                    'assets/images/instagram-logo.png',
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          height: 50,
                          child: FlatButton(
                            onPressed: () => launch(
                                "https://sarahweddingplanner.com/"),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Our WebSite',
                                  style: TextStyle(
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  child: Image.asset(
                                    'assets/images/global.png',
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
