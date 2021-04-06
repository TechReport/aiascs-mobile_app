import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TransactionServiceCardModel {
  final String title;
  final dynamic iconPath;

  TransactionServiceCardModel({ @required  this.title, this.iconPath = ""});

  static List<TransactionServiceCardModel> defaultData() {
    return [
TransactionServiceCardModel(
  title: "Reports",
  iconPath: Icons.assessment
  
),
TransactionServiceCardModel(
  title: "Feedback",
  iconPath:Icons.feedback_sharp
),
TransactionServiceCardModel(
  title: "Assings",
  iconPath:   Icons.report
),

TransactionServiceCardModel(
  title:"ChainStatus",
  iconPath: Icons.check_outlined
),
TransactionServiceCardModel(
  title: "Add",
  iconPath: Icons.add
),
TransactionServiceCardModel(
  title:"Notification",
  iconPath: Icons.notifications_active
  ),
    ];
  }



static List<TransactionServiceCardModel> defaultInvetoryData() {
    return [
TransactionServiceCardModel(
  title: "Monitor",
  iconPath: Icons.monitor
  
),
TransactionServiceCardModel(
  title: "Products",
  iconPath:Icons.featured_play_list_sharp
),

    ];
  }

}
