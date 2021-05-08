import 'package:aiascs_mobile/models/Analysing_Report_model.dart';
import 'package:aiascs_mobile/modules/services_module/reports/components/Visualisation_analysing_body.dart';
import 'package:flutter/material.dart';

class VisualisationAnallysingReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: AnalysingReportModel.defaultValues().length,
        itemBuilder: (context, int analysingReportModelIndex) {
          AnalysingReportModel analysingReport =  AnalysingReportModel.defaultValues()[analysingReportModelIndex];
          return VisualisationAnalysingBody(
            title: analysingReport.title,
            visualValue: analysingReport.value,
            visualIcon: analysingReport.icon,
          );
        });
  }
}
