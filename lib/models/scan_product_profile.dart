import 'package:aiascs_mobile/models/Product.dart';
import 'package:flutter/foundation.dart';

class ScanProductProfile {
  int productId;
  String profileTitle;
  String profileValue;

  ScanProductProfile(
      {@required this.productId,
      @required this.profileTitle,
      @required this.profileValue});

  factory ScanProductProfile.fromJson(Map<String, dynamic> json) {
    return ScanProductProfile(
        productId: json[''], profileTitle: json[''], profileValue: json['']);
  }

  Map toOffline(ScanProductProfile scanProductProfile) {
    var map = Map<String, dynamic>();
    map[''] = scanProductProfile.productId;
    map[''] = scanProductProfile.profileTitle;
    map[''] = scanProductProfile.profileValue;
    return map;
  }

  ScanProductProfile.fromOffline(Map<String, dynamic> map) {
    this.productId = map[''];
    this.profileTitle = map[''];
    this.profileValue = map[''];
  }

 static List<ScanProductProfile> defaultProductProfileData() {
    return [
      ScanProductProfile(productId: 1,profileTitle: "Product Name",profileValue:" HDGTV-DAJFAK" ),
       ScanProductProfile(productId: 2,profileTitle: "Product Id",profileValue: "yifoad-4098-vdfj-jdlkf"),
        ScanProductProfile(productId: 3,profileTitle: "Manufacture Name",profileValue: "Seedco Company Limited"),
         ScanProductProfile(productId: 4,profileTitle: "Manufacture Date",profileValue: "12-06-2005"),
          ScanProductProfile(productId: 5,profileTitle: "Expire Date",profileValue: "15-06-2027"),
           ScanProductProfile(productId: 6,profileTitle: "isRevoked",profileValue: "true"),
            ScanProductProfile(productId: 7,profileTitle: "Country",profileValue: "Tanzania"),
             ScanProductProfile(productId: 8,profileTitle: "State",profileValue: "Dar es salaam"),
              ScanProductProfile(productId: 9,profileTitle: "support",profileValue: "GEN-profile"),
    ];
  }
}
