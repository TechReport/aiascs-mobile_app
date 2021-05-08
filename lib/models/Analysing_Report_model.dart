import 'package:flutter/material.dart';

class AnalysingReportModel {
  final String id;
  final String title;
  final Icon icon;
  final String value;

  AnalysingReportModel({this.id = "", this.title = "", this.icon, this.value});

  static List<AnalysingReportModel> defaultValues() {
    return [
 AnalysingReportModel(
   id: "1",
   title: "Fake Products",
   icon: Icon(Icons.linear_scale_sharp,size: 40,color: Colors.red,),
   value: "1400"
 ),
  AnalysingReportModel(
   id: "2",
   title: "Genuine Products",
   icon: Icon(Icons.linear_scale_sharp,size: 40,color: Colors.green,),
   value: "1380"
 ),
  AnalysingReportModel(
   id: "3",
   title: "Unothirized Products",
   icon: Icon(Icons.linear_scale_sharp,size: 40,color: Colors.blue,),
   value: "10"
 ),
 AnalysingReportModel(
   id: "4",
   title: "Unknown Products",
   icon: Icon(Icons.linear_scale_sharp,size: 40,color: Colors.amber,),
   value: "961"
 ),
  AnalysingReportModel(
   id: "5",
   title: "Other Products",
   icon: Icon(Icons.linear_scale_sharp,size: 40,color: Colors.grey,),
   value: "1400"
 ),
    ];
  }
}
