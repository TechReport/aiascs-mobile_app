import 'package:flutter/material.dart';

class District {
  final String district_name;
  final int district_code;
  final int region_code;
  District(
      {@required this.district_name,
      @required this.district_code,
      @required this.region_code});

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
        district_name: json['name'],
        district_code: json['districtcode'],
        region_code: json['Regions']);
  }
}