import 'package:flutter/foundation.dart';

class FeedbackModel {
  String from;
  String message;
  String id;

  FeedbackModel(
      {this.from = "farmer", @required this.id, @required this.message});

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json['_id'], message: json['message']);}
      
}
