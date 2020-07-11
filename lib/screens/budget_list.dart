import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/submit_button.dart';
import '../model/data_info.dart';

class BudgetList extends StatefulWidget {
  static const String id = '/budget_list';

  @override
  _BudgetListState createState() => _BudgetListState();
}

class _BudgetListState extends State<BudgetList> {
  Map<String, String> values = {
    'Photo + Video': 'EGP 5.500',
    'Flowers': 'EGP 1.500',
    'Music': 'EGP 2000',
    'Hotel & Transportation': 'EGP 4000',
    'Stationery': 'EGP 3000',
    'Dress': 'EGP 1000',
    'Tables & Chairs': 'EGP 6000',
    'Rings': 'EGP 500',
    'Cosha': 'EGP 5000',
    'Back drop': 'EGP 250',
    'Lighting': 'EGP 950',
    'Accessories': 'EGP 550',
    'Gifts': 'EGP 350',
  };

  Data bg = Data();

  int _budget = 0;
  @override
  void initState() {
    bg.getBudget().then(update);
    super.initState();
  }

  void update(int name) {
    setState(() {
      this._budget = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_budget <= 9999 || _budget > 40001) {
      values = {
        'Photo + Video': 'EGP 5.500',
        'Flowers': 'EGP 1.500',
        'Music': 'EGP 2000',
        'Hotel & Transportation': 'EGP 4000',
        'Stationery': 'EGP 3000',
        'Dress': 'EGP 1000',
        'Tables & Chairs': 'EGP 6000',
        'Rings': 'EGP 500',
        'Cosha': 'EGP 5000',
        'Back drop': 'EGP 250',
        'Lighting': 'EGP 950',
        'Accessories': 'EGP 550',
        'Gifts': 'EGP 350',
      };
    } else if (_budget <= 10000 || _budget <= 19999) {
      values = {
        '10 Tables & 100 Chairs': 'EGP 5000 to 6000',
        '10 Centerpieces': 'EGP 1500 to 2000',
        'Kosha': 'EGP 5000',
        'DJ': 'EGP 3000 to 4000',
        'Dance Floor': 'EGP 1500 to 2000',
        'Lights': 'EGP 1500 to 2000',
        'Entrance': 'EGP 1800 to 2500',
      };
    } else if (_budget <= 20000 || _budget <= 29999) {
      values = {
        '10 Tables & 100 Chairs': 'EGP 7000 to 8000',
        '10 Centerpieces': 'EGP 2000 to 3000',
        'Kosha': 'EGP 1800 to 2500',
        'DJ': 'EGP 3500 to 4000',
        'Dance Floor': 'EGP 2500 to 3500',
        'Lights': 'EGP 2500 to 3000',
        'Entrance': 'EGP 2500 to 3000',
        'Backdrop': 'EGP 2500 to 3000',
      };
    } else if (_budget >= 30000 || _budget <= 40000) {
      values = {
        '10 Tables & 100 Chairs': 'EGP 8000 to 10000',
        '10 Centerpieces': 'EGP 3500 to 4500',
        'Kosha': 'EGP 2000 to 3500',
        'DJ': 'EGP 4000 to 6000',
        'Dance Floor': 'EGP 4000 to 5500',
        'Lights': 'EGP 3000 to 3500',
        'Entrance': 'EGP 3000 to 3500',
        'Backdrop': 'EGP 3000 to 3500',
      };
    }

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: Scaffold(
          backgroundColor: Color(0xffb3cac7),
          appBar: AppBar(
            backgroundColor: Colors.teal,
            centerTitle: true,
            title: Text(
              'BUDGET',
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            actions: <Widget>[

              FlatButton(
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text("enter your budget"),
                          content: TextFormField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
                            onChanged: (String num) {
                              setState(() async {
                                await bg.saveBudget(int.parse(num));
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
                                    buttonTitle: 'Save',
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    }),
                              ],
                            ),
                          ],
                        );
                      }).then((_) => setState(() {
                    bg.getBudget().then(update);
                  }));
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),

            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(height: 1),
              Card(
                elevation: 2,
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text(
                      'Total Budget',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                        fontFamily:
                            Theme.of(context).textTheme.body1.fontFamily,
                      ),
                    ),
                    trailing: Text(
                      'EGP $_budget',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 20,
                        fontFamily:
                            Theme.of(context).textTheme.body1.fontFamily,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: values.keys.map((String key) {
                    return Container(
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          key,
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                        trailing: Text(
                          values[key],
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
