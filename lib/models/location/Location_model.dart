import 'package:flutter/foundation.dart';

class LocationModel {
  String district;
  String ward;
  String region;

  LocationModel({
    @required this.district,
    @required this.ward,
    @required this.region
  });
}
