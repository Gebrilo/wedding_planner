import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_screen.dart';
import 'gender_screen.dart';
import '../Services/auth.dart';
import '../model/data_info.dart';

class SettingScreen extends StatefulWidget {
  static const id = '/setting_screen';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Data date = Data();

  final AuthService _auth = AuthService();

  String _fianceName = "";
  String _usersName = "";
  String _date = "";
  @override
  void initState() {
    date.getUserName().then(updateName);
    date.getFName().then(updateFName);
    date.getDate().then(updateDate);
    super.initState();
  }

  void updateName(String name) {
    setState(() {
      this._usersName = name;
    });
  }

  void updateFName(String name) {
    setState(() {
      this._fianceName = name;
    });
  }

  void updateDate(String name) {
    setState(() {
      this._date = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.grey,
            centerTitle: true,
            title: Text(
              'SETTINGS',
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              SettingField(
                title: 'Your name',
                value: _usersName,
              ),
              Divider(
                color: Colors.grey,
                height: 2,
              ),
              SettingField(
                title: 'Fiance name',
                value: _fianceName,
              ),
              Divider(
                color: Colors.grey,
                height: 2,
              ),
              SettingField(title: 'WEDDING DATE', value: "$_date"),
              Divider(
                color: Colors.grey,
                height: 2,
              ),
              NotificationField(
                title: 'NOTIFICATIONS',
                notification: false,
              ),
              Divider(
                color: Colors.grey,
                height: 2,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 25,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.info,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Help',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily:
                            Theme.of(context).textTheme.body1.fontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 25,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.help_outline,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'About',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily:
                            Theme.of(context).textTheme.body1.fontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Logins',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    FlatButton(
                      child: Text('Add account'),
                      textColor: Colors.grey,
                      onPressed: () async {
                        await _auth.signOut();
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.clear();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GenderScreen(),
                            ));
                      },
                    ),
                    Container(
                      child: FlatButton(
                        child: Text('Sign out'),
                        textColor: Colors.grey,
                        onPressed: () async {
                          await _auth.signOut();
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.clear();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GenderScreen(),
                              ));
                        },
                      ),
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

// Name & FName & Date of Event
class SettingField extends StatelessWidget {
  final String title;
  final String value;

  SettingField({
    this.title,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.body1.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.body1.fontFamily,
              fontWeight: FontWeight.w300,
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// Notification Switch ....
class NotificationField extends StatefulWidget {
  final String title;
  final bool notification;

  NotificationField({this.title, this.notification});

  @override
  _NotificationFieldState createState() => _NotificationFieldState();
}

class _NotificationFieldState extends State<NotificationField> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.body1.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          Switch(
            onChanged: (bool value) {
              setState(() => this._switchValue = value);
            },
            value: this._switchValue,
          ),
        ],
      ),
    );
  }
}
