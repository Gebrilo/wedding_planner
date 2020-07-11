import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/data_info.dart';
import '../widgets/submit_button.dart';
import 'package:provider/provider.dart';
import 'package:wedding_planner/Services/database.dart';
import 'package:wedding_planner/model/user.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    Key key,
  }) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  Data data = Data();
  String userName = "";
  String weddingDay = "";
  int budget = 0;
  String number = '';
  bool x = false;

  @override
  void initState() {
    data.getUserName().then(updateName);
    data.getDate().then(updatedate);
    data.getBudget().then(updatebbb);
    data.getList().then(updateList);

    super.initState();
  }

  void updateName(String name) {
    setState(() {
      this.userName = name;
    });
  }

  void updateList(List<String> list) {
    setState(() {
      this.category = list;
    });
  }

  void updatedate(String name) {
    setState(() {
      this.weddingDay = name;
    });
  }

  void updatebbb(int name) {
    setState(() {
      this.budget = name;
    });
  }


  Map<String, bool> values = {
    'Photo + Video': false,
    'Flowers': false,
    'Music': false,
    'Hotel & Transportation': false,
    'Stationery': false,
    'Dress': false,
    'Tables & Chairs': false,
    'Rings': false,
    'Cosha': false,
    'Back drop': false,
    'Lighting': false,
    'Accessories': false,
    'Gifts': false,
  };
  List<String> category = [];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          width: 361,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 70,
              ),
              Text(
                'Send Request',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: FlatButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text("Please enter your mobile number"),
                            content: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.start,
                              onChanged: (String number) {
                                setState(() {
                                  this.number = number;
                                });
                              },
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  BottomButton(
                                      buttonTitle: 'close',
                                      onTap: () {
                                        Navigator.pop(context);
                                      }),
                                  BottomButton(
                                      buttonTitle: 'save',
                                      onTap: () async {
                                        await DatabaseService(uid: user.uid)
                                            .updateUserData(
                                          await data.getUserName(),
                                          await data.getDate(),
                                          await data.getBudget(),
                                          int.parse(number),
                                        );
                                        Navigator.pop(context);
                                      }),
                                ],
                              )
                            ],
                          );
                        });
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
              children: values.keys.map((String key) {
            return Container(
//                padding: EdgeInsets.only(right: 10,),
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                      color: Theme.of(context).accentColor, width: 1),
                  right: BorderSide(
                      color: Theme.of(context).accentColor, width: 1),
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: ListTile(
                title: Center(
                  child: Text(
                    key,
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
                trailing: SizedBox(
                  width: 15,
                ),
                leading: Checkbox(
                  value: values[key],
                  onChanged: (bool chick) {
                    setState(() {
                      if (values[key] != chick) {
                        values[key] = chick;
                        data.saveList(category);
                      }
                    });
                  },
                ),
              ),
            );
          }).toList()),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
