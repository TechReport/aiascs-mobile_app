import 'package:aiascs_mobile/core/components/Line_separator.dart';
import 'package:flutter/material.dart';

class QRCodeHeader extends StatelessWidget {
  const QRCodeHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        padding: EdgeInsets.symmetric(vertical: 0),
        color:  Color(0xFF264653),
        child: Column(
          children: [
            LineSeperator(
              color: Colors.grey,
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("       "),
                Text("Product Profile",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300)),
            
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            LineSeperator(
              color: Colors.grey,
              height: 1,
            )
          ],
        ));
  }
}
