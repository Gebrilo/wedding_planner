import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.cardChild, this.onPress, this.gender});
  final Widget gender;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: <Widget>[
          Container(
            child: cardChild,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            child: gender,
          ),
        ],
      ),
    );
  }
}
