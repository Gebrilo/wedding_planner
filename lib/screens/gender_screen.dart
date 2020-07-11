import 'package:flutter/material.dart';
import 'package:wedding_planner/loading.dart';
import 'package:wedding_planner/main.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../model/data_info.dart';
import 'package:http/http.dart' as http;

class GenderScreen extends StatefulWidget {
  static const id = '/gender_screen';

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  Gender selectedGender;
  Data data = Data();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userName;
  String fName;
  bool spinner = false;


  Widget _buildTextField() {
    return Column(
      children: <Widget>[
        Container(
          width: 350,
          child: TextFormField(
            style: TextStyle(
              color: selectedGender == Gender.female
                  ? kBackGroundMaleColor
                  : kBackGroundGirlColor,
            ),
            decoration: kTextFieldDecoration.copyWith(
              hintText: 'Enter Your Full Name',
              labelText: 'Name',
              labelStyle: TextStyle(
                color: selectedGender == Gender.female
                    ? kBackGroundMaleColor
                    : kBackGroundGirlColor,
              ),
              hintStyle: TextStyle(
                color: selectedGender == Gender.female
                    ? kBackGroundMaleColor
                    : kBackGroundGirlColor,
              ),
            ),
            // ignore: missing_return
            validator: (String value) {
              if (value.isEmpty || value.length < 5) {
                return 'Title is required and should be 5+ characters long.';
              }
            },
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            onChanged: (String value1) {
              userName = value1;
              data.saveUserName(value1);
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 350,
          child: TextFormField(
            style: TextStyle(
              color: selectedGender == Gender.female
                  ? kBackGroundMaleColor
                  : kBackGroundGirlColor,
            ),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            // ignore: missing_return
            validator: (String value) {
              if (value.isEmpty || value.length < 4) {
                return 'Fiance Name is required and should be 4+ characters long.';
              }
            },
            onSaved: (String valueF) {
              fName = valueF;
              data.saveFName(valueF);
            },
            decoration: kTextFieldDecoration.copyWith(
              hintText: 'Enter Your Fiance Name',
              labelText: 'Fiance Name',
              hintStyle: TextStyle(
                color: selectedGender == Gender.female
                    ? kBackGroundMaleColor
                    : kBackGroundGirlColor,
              ),
              labelStyle: TextStyle(
                color: selectedGender == Gender.female
                    ? kBackGroundMaleColor
                    : kBackGroundGirlColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return FlatButton(
      child: Text('Save'),
      textColor:
          selectedGender == Gender.female ? Color(0xff757575) : Colors.white,
      onPressed: () {
        if (!_formKey.currentState.validate()) {
          return;
        }
        _formKey.currentState.save();
        if (selectedGender != Gender.female && selectedGender != Gender.male) {
          return;
        }
        GenderSelector gs = GenderSelector(
          genders: selectedGender,
        );
        setState(() => spinner = true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyApp(
              selectedGender: gs.gender(selectedGender),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return spinner
        ? Loading()
        : SafeArea(
            child: WillPopScope(
              onWillPop: () async{
                Navigator.pop(context);
                return false;
              },
              child: Scaffold(
                backgroundColor: selectedGender == Gender.male
                    ? kActiveCardColorM
                    : kActiveCardColorF,
                body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                child: Text(
                                  'I am...',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
                                    color: selectedGender == Gender.female
                                        ? Color(0xff757575)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ReusableCard(
                                      onPress: () {
                                        setState(() {
                                          selectedGender = Gender.female;
                                        });
                                      },
                                      cardChild:
                                          Image.asset('assets/images/alb_f.png'),
                                      gender: Container(
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(
                                              color:
                                                  selectedGender == Gender.female
                                                      ? kBorderColorF
                                                      : kBorderColorM),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'BRIDE',
                                            style: TextStyle(
                                                color: selectedGender ==
                                                        Gender.female
                                                    ? Color(0xff757575)
                                                    : Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ReusableCard(
                                      onPress: () {
                                        setState(() {
                                          selectedGender = Gender.male;
                                        });
                                      },
                                      cardChild:
                                          Image.asset('assets/images/alb_m.png'),
                                      gender: Container(
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(
                                              color:
                                                  selectedGender == Gender.female
                                                      ? kActiveCardColorM
                                                      : Colors.white),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'GROOM',
                                            style: TextStyle(
                                                color: selectedGender ==
                                                        Gender.female
                                                    ? Color(0xff757575)
                                                    : Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              _buildTextField(),
                              SizedBox(
                                height: 10,
                              ),
                              _buildSaveButton(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Future<http.Response> fetchPost() {
    return http.get('http://172.20.10.5:8000/api/items');
  }
}
