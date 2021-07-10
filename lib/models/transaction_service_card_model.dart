import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TransactionServiceCardModel {
  final String id;
  final String title;
  final dynamic iconPath;

  TransactionServiceCardModel({@required this.id,@required this.title, this.iconPath = ""});

  static List<TransactionServiceCardModel> defaultData() {
    return [
      TransactionServiceCardModel(title: "Reports", iconPath: Icons.assessment,id: "report"),
           TransactionServiceCardModel(
          title: "Products", iconPath: Icons.featured_play_list_sharp,id: "product"),
      TransactionServiceCardModel(
          title: "Feedback", iconPath: Icons.feedback_sharp,id: "feedback"),
      // TransactionServiceCardModel(title: "Assings", iconPath: Icons.report,id: "assign"),
      // TransactionServiceCardModel(
      //     title: "ChainStatus", iconPath: Icons.check_outlined,id: "chainstatus"),
      // TransactionServiceCardModel(title: "Add", iconPath: Icons.add,id: "add"),
      
      TransactionServiceCardModel(
          title: "Feeds", iconPath: Icons.notifications_active,id: "notification"),
    ];
  }

  static List<TransactionServiceCardModel> defaultInvetoryData() {
    return [
      // TransactionServiceCardModel(title: "Monitor", iconPath: Icons.monitor,id: "monitor"),
      TransactionServiceCardModel(
          title: "Products", iconPath: Icons.featured_play_list_sharp,id: "product"),
    ];
  }
}
