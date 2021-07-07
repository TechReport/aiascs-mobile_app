import 'package:flutter/material.dart';

class Ward {
  final String ward_name;
  final int ward_code;
  final int district_code;
  Ward(
      {@required this.ward_name,
      @required this.ward_code,
      @required this.district_code});
  factory Ward.fromJson(Map<String, dynamic> json) {
    return Ward(
        ward_name: json['name'],
        ward_code: json['WardCode'],
        district_code: json['Council']);
  }
}