

import 'package:aiascs_mobile/core/components/Line_separator.dart';
import 'package:flutter/material.dart';

class VisualisationAnalysingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/8,
      child: Column(
        children: [
          Row(
        children: [
          Expanded(
            child: Text("1")
          ),
           Expanded(
            child:  Icon(Icons.ac_unit)
          )
        ],
      ),
      LineSeperator(color: Colors.grey)
        ],
      ),
    );
  }
}