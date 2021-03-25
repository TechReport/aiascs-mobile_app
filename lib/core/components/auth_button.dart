import 'package:flutter/material.dart';

class AuthaSaveButton extends StatelessWidget {
  const AuthaSaveButton(
      {Key key,
      this.width = double.infinity,
      @required this.label,
      @required this.labelColor,
      @required this.buttonColor,
      this.marginLeft = 65.0,
      this.marginRight = 64.0,
      this.fontSize = 15.0,
      this.horizontal = 10.0,
      this.vertical = 15.0,
      this.borderColor,
      this.onPressButton})
      : super(key: key);

  final String label;
  final Color labelColor;
  final double fontSize;
  final Color buttonColor;
  final Function onPressButton;
  final double width;
  final double marginLeft;
  final double marginRight;
  final double vertical;
  final double horizontal;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        // width: width,
        child: FlatButton(
          color: buttonColor,
          height: 50.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor == null ? buttonColor : borderColor,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          onPressed: onPressButton,
          child: Text(
            label,
            style: TextStyle().copyWith(
              color: labelColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}