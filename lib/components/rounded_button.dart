import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, @required this.onPressed});

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 17.0),
      child: OutlineButton(
        highlightedBorderColor: Theme.of(context).accentColor,
        borderSide: BorderSide(color: Theme.of(context).accentColor),
        shape: StadiumBorder(),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.body1.fontFamily,
            fontWeight: FontWeight.w200,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Theme.of(context).textTheme.body1.color,
          ),
        ),
      ),
    );
  }
}
