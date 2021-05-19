import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class VisualisationGraph extends StatelessWidget {
  final double genuine;
  final double fake;
  final double others;
VisualisationGraph({this.genuine = 0,this.fake = 0,this.others = 1 });
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {"Genuine": genuine, "Fake": fake, "Others": others};

    List<Color> colorList = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.grey
    ];

    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(0),
      child: Material(
        color: Colors.white,
        elevation: 0,
        child: PieChart(
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 1000),
          chartLegendSpacing: 50,
          chartRadius: MediaQuery.of(context).size.width / 2 - 20,
          colorList: colorList,
          initialAngleInDegree: 36,
          chartType: ChartType.disc,
          ringStrokeWidth: 32,
          centerText: "",
          legendOptions: LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.left,
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValuesOutside: true,
            decimalPlaces: 0,
          ),
        ),
      ),
    );
  }
}
