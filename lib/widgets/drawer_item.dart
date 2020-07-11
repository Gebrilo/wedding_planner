import 'package:flutter/material.dart';
import '../screens/budget_list.dart';
import '../screens/category_list_screen.dart';
import '../screens/setting_screen.dart';
import '../screens/todo_screen.dart';
import '../screens/contact_screen.dart';

class SideMenu extends StatelessWidget {
  static const id = '/drawer_item';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border(
            right: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'wedding',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).textTheme.body1.color,
                        fontFamily:
                            Theme.of(context).textTheme.title.fontFamily,
                      ),
                    ),
                    Expanded(
                        child: Image.asset('assets/images/welcome_logo.png')),
                    Text(
                      'Planner',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).textTheme.body1.color,
                        fontFamily:
                            Theme.of(context).textTheme.title.fontFamily,
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ListCategory(
                    icon: Icon(
                      Icons.check_box,
                      color: Colors.lightBlueAccent,
                    ),
                    title: 'To-dos list',
                    color: Colors.lightBlueAccent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TodoScreen()));
                    },
                  ),
                  ListCategory(
                    icon: Icon(
                      Icons.folder,
                      color: Colors.blue,
                    ),
                    title: 'Categories',
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryList()));
                    },
                  ),
                  ListCategory(
                    icon: Icon(
                      Icons.attach_money,
                      color: Color(0xff49bdaa),
                    ),
                    title: 'Budget',
                    color: Color(0xff49bdaa),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BudgetList(),
                          ));
                    },
                  ),
                  ListCategory(
                    icon: Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
                    title: 'Contact',
                    color: Colors.green,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactScreen()));
                    },
                  ),
                  ListCategory(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                    title: 'Settings',
                    color: Colors.grey,
                    onTap: () {
                      Navigator.pushNamed(context, SettingScreen.id);
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

class ListCategory extends StatelessWidget {
  final Icon icon;
  final Color color;
  final String title;
  final Function onTap;
  ListCategory({this.onTap, this.title, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontFamily: Theme.of(context).textTheme.body1.fontFamily,
        ),
      ),
      onTap: onTap,
    );
  }
}
