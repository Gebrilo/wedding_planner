import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        margin: EdgeInsets.only(right: 15),
        child: Center(
          child: Text(
            buttonTitle,
          ),
        ),
        width: 50,
      ),
    );
  }
}
