import 'package:flutter/material.dart';
import 'package:wedding_planner/model/data_info.dart';

class TodoScreen extends StatefulWidget {
  static const String id = 'todo_screen';

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  Map<String, bool> values = {
    'Photo + Video': true,
    'Flowers': true,
    'Music': true,
    'Hotel & Transportation': true ,
    'Stationery': true ,
    'Dress': true,
    'Tables & Chairs': true,
    'Rings': true,
    'Cosha': true,
    'Back drop': true,
    'Lighting': true ,
    'Accessories': true,
    'Gifts': true,
  };


  Data _data = Data();

  @override
  void initState() {
    _data.getList().then(updateList);
    super.initState();
  }

  void updateList(List<String> list) {
    setState(() {
      this.category = list;
    });
  }

  List<String> category = [];

void backScreen(){
  Navigator.pop(context);
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => Future.value(true),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            centerTitle: true,
            title: Text(
              'To-dos list',
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
                height: 1,
              ),
              Expanded(
                child: ListView(
                  children: values.keys.map((String key){
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Center(
                          child: Text(
                            key,
                            style:
                            TextStyle(color: Colors.lightBlueAccent),
                          ),
                        ),
                        trailing: Icon(Icons.done_all),
                        leading: Checkbox(
                          value: values[key],
                          onChanged: (bool chick){
                            setState(() {
                              if(values[key] != chick){
                                values[key] = chick;
                              }
                            });
                          },
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