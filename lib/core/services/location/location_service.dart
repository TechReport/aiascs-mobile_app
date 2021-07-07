import 'dart:convert';
import 'package:aiascs_mobile/core/services/http_service/http_service.dart';
import 'package:aiascs_mobile/models/location/district.dart';
import 'package:aiascs_mobile/models/location/region.dart';
import 'package:aiascs_mobile/models/location/ward.dart';
import 'package:http/http.dart';

class LocationServices {
  Future<List<Region>> GetRegion() async {
    String secondaryUrl = "/Region/";
    Response response = await HttpService().getThirdHttp(secondaryUrl);
    List<Region> regions = [];
    if (response.statusCode == 200) {
      for (dynamic data in json.decode(response.body)) {
        regions.add(Region.fromJson(data));
      }
      return regions;
    } else {
      return regions;
    }
  }

  Future<List<District>> GetDistrict() async {
    String secondaryUrl = "/District/";
    Response response = await HttpService().getThirdHttp(secondaryUrl);
    List<District> districts = [];

    if (response.statusCode == 200) {
      for (dynamic data in json.decode(response.body)) {
        districts.add(District.fromJson(data));
      }
      return districts;
    } else {
      return districts;
    }
  }

  Future<List<Ward>> GetWard() async {
    String secondaryUrl = "/ward/";
    Response response = await HttpService().getThirdHttp(secondaryUrl);
    List<Ward> wards=[];

    if (response.statusCode == 200) {
      for (dynamic data in json.decode(response.body)) {
        wards.add(Ward.fromJson(data));
      }
      //print(response.body);
      return wards;}
    else {
      return wards;
      // print("fail");
     
    }
  }
}