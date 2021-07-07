import 'package:flutter/material.dart';

class Region {
  final String region_name;
  final int region_code;
  Region({@required this.region_name, @required this.region_code});

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(region_name: json['name'], region_code: json['RegionCode']);
  }
}