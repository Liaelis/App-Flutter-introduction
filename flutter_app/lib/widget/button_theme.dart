

import 'package:flutter/material.dart';

class ButtonThemeApp extends StatelessWidget {
  String text;
  Function onPressed;

  ButtonThemeApp(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.cyan,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        onPressed: () => onPressed());
  }
}
