import 'package:aiascs_mobile/modules/services_module/component/report_selection_top_bar.dart';
import 'package:aiascs_mobile/modules/services_module/reports/components/Visualisation_graph.dart';
import 'package:flutter/material.dart';

class AllReports extends StatefulWidget {
  @override
  _AllReportsState createState() => _AllReportsState();
}

class _AllReportsState extends State<AllReports> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReportSelectinTopBar(
            isClicked: isSelected,
            onSelectGeneralReport: () {
              setState(() {
                isSelected = true;
              });
            },
            onSelectVisualisation: () {
               setState(() {
                   isSelected = false;
               });
            },
          ),
         VisualisationGraph(),
         Container(
           padding: EdgeInsets.symmetric(
             horizontal: 20,
             vertical: 20
           ),
           child: Text("Analysing",style: TextStyle(
             color: Colors.black26,
             fontWeight: FontWeight.bold,
             fontSize: 17
           ),),
         )
        ],
      ),
    );
  }
}
