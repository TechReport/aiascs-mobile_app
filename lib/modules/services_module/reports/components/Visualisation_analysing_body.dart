import 'package:flutter/material.dart';

class VisualisationAnalysingBody extends StatelessWidget {
  final String title;
  final String visualValue;
  final Icon visualIcon;
  VisualisationAnalysingBody({this.title = "", this.visualIcon , this.visualValue =""});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 10,
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  flex: 2,
                  child: Text("    $title",
                      style: TextStyle(color: Colors.grey, fontSize: 16))),
              Expanded(flex: 2, child: visualIcon,),
              Expanded(child: Text("$visualValue", style: TextStyle(color: Colors.grey, fontSize: 16)))
            ],
          ),
        ],
      ),
    );
  }
}
