import 'package:aiascs_mobile/app_state/product_state.dart';
import 'package:aiascs_mobile/app_state/unAuthorizedProduct_State.dart';
import 'package:aiascs_mobile/models/Analysing_Report_model.dart';
import 'package:aiascs_mobile/modules/services_module/reports/components/Visualisation_analysing_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VisualisationAnallysingReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductState>(
        builder: (BuildContext context, productState, child) {
      return Consumer<UnAuthorizedProductState>(
          builder: (BuildContext context, unAuthorizedState, child) {
        return Column(
        children: AnalysingReportModel.defaultValues(
          fake: (productState.countFakeProduct + unAuthorizedState.listUnAuthProduct.length).toString(),
          genuine: productState.countGenuineProduct.toString(),
          otherProduct: (productState.countAllProductProduct - (productState.countFakeProduct +productState.countGenuineProduct)).toString(),
          unothirized: unAuthorizedState.listUnAuthProduct.length.toString()
          // productState.countAllProductProduct.toString()
        )
            .map((AnalysingReportModel analysingReport) {
          return VisualisationAnalysingBody(
            title: analysingReport.title,
            visualValue: analysingReport.value,
            visualIcon: analysingReport.icon,
          );
        }).toList(),
      );
      });
    });
  }
}
