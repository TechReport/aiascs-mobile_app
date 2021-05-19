import 'package:aiascs_mobile/core/components/Line_separator.dart';
import 'package:flutter/material.dart';

class ProductReportHeader extends StatelessWidget {
  const ProductReportHeader({Key key,this.status = "Genuine"}) : super(key: key);
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        padding: EdgeInsets.symmetric(vertical: 0),
        color: Colors.white,
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
                Text("     "),
             status == "Genuine" ?
                Text("Genuine Product",
                    style: TextStyle(
                        color: Color(0xFF264653),
                        fontSize: 20,
                        fontWeight: FontWeight.w300)):
                           Text("Fake Product",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w300)),
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
