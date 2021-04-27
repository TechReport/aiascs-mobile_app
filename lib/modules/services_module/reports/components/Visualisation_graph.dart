import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class VisualisationGraph extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     Map<String, double> dataMap = {
    "Genuine": 20,
    "Fake": 10,
    "UnKnown": 10,
    "Others": 1
  };

  List<Color> colorList = [Colors.red, Colors.green, Colors.blue, Colors.grey];


    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Material(
        elevation: 1,
        child: PieChart(
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: 32,
          chartRadius: MediaQuery.of(context).size.width / 3.2,
          colorList: colorList,
          initialAngleInDegree: 0,
          chartType: ChartType.disc,
          ringStrokeWidth: 32,
          centerText: "AIASCS",
          legendOptions: LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.right,
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: false,
            showChartValuesOutside: false,
            decimalPlaces: 1,
          ),
        ),
      ),
    );
  }
}
