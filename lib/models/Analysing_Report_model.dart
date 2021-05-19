import 'package:flutter/material.dart';

class AnalysingReportModel {
  final String id;
  final String title;
  final Icon icon;
  final String value;

  AnalysingReportModel({this.id = "", this.title = "", this.icon, this.value});

  static List<AnalysingReportModel> defaultValues({@required String fake,@required String genuine ,@required String unothirized,@required String otherProduct}) {
    return [
 AnalysingReportModel(
   id: "1",
   title: "Fake Products",
   icon: Icon(Icons.linear_scale_sharp,size: 40,color: Colors.red,),
   value: fake
 ),
  AnalysingReportModel(
   id: "2",
   title: "Genuine Products",
   icon: Icon(Icons.linear_scale_sharp,size: 40,color: Colors.green,),
   value: genuine
 ),
  AnalysingReportModel(
   id: "3",
   title: "Unothirized Products",
   icon: Icon(Icons.linear_scale_sharp,size: 40,color: Colors.blue,),
   value: unothirized
 ),

  AnalysingReportModel(
   id: "5",
   title: "Other Products",
   icon: Icon(Icons.linear_scale_sharp,size: 40,color: Colors.grey,),
   value: otherProduct
 ),
    ];
  }
}
