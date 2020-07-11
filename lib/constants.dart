import 'package:flutter/material.dart';

// female color style .....
const kInactiveCardColor = Color(0xfff6e9e7);
const kBorderColorF = Color(0xFFEB1555);
const kActiveCardColorF = Color(0xfff6e9e7);
const kBackGroundGirlColor = Color(0xfff6e9e7);
const kTextColorF = Color(0xFFEB1555);

// male color style ......
const kActiveCardColorM = Color(0xff30333e);
const kBorderColorM = Color(0xfffdd665);
const kBackGroundMaleColor = Color(0xff30333e);
const kTextColorM = Color(0xfffdd665);

const kTextFieldDecoration = InputDecoration(
  hintText: 'enter value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 1.0, color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(1.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 1.0, color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(0.0)),
  ),
);
