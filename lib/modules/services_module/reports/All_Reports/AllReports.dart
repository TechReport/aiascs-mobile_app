import 'package:aiascs_mobile/app_state/product_state.dart';
import 'package:aiascs_mobile/modules/services_module/component/Visualisation_analysing_report.dart';
import 'package:aiascs_mobile/modules/services_module/component/report_selection_top_bar.dart';
import 'package:aiascs_mobile/modules/services_module/reports/components/Visualisation_graph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllReports extends StatefulWidget {
  @override
  _AllReportsState createState() => _AllReportsState();
}

class _AllReportsState extends State<AllReports> {
  bool isSelected = false;
  double fake, genuine, others;

  @override
  void initState() {
    super.initState();
    genuine =
        Provider.of<ProductState>(context, listen: false).countGenuineProduct;
    fake = Provider.of<ProductState>(context, listen: false).countFakeProduct;
    others = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductState>(
        builder: (BuildContext context, productState, child) {
      return Scaffold(
        body: SingleChildScrollView(
                  child: Column(
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
              VisualisationGraph(
                genuine: genuine,
                fake: fake,
                others: others,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  "Analysing",
                  style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
             VisualisationAnallysingReport()
            ],
          ),
        ),
      );
    });
  }
}
