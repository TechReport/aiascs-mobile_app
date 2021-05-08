
import 'package:flutter/material.dart';

class EnterTokenButton extends StatelessWidget {
  final double height;
 final double width;
 final String title;
final Function onPressButton;
  
  EnterTokenButton({
    @required this.onPressButton,
    @required this.title, this.height = 30, this.width = 85});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: height,
          width: width,
          child: RaisedButton(
            color: Color(0xFF264653),
            onPressed:onPressButton,
            child: Text(
              '$title',
              style: TextStyle(color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white)),
          ),
        ));
  }
}
