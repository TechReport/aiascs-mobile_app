import 'package:aiascs_mobile/core/components/Line_separator.dart';
import 'package:flutter/material.dart';

class VisualisationAnalysingBody extends StatelessWidget {
  final String title;
  final String visualValue;
  final Icon visualIcon;
  VisualisationAnalysingBody({this.title = "", this.visualIcon , this.visualValue =""});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 8,
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  flex: 2,
                  child: Text("    $title",
                      style: TextStyle(color: Colors.grey, fontSize: 12))),
              Expanded(flex: 2, child: visualIcon),
              Expanded(child: Text("$visualValue"))
            ],
          ),
          LineSeperator(color: Colors.grey[100])
        ],
      ),
    );
  }
}
