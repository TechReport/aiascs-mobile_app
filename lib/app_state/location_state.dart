import 'package:aiascs_mobile/core/services/location/location_service.dart';
import 'package:aiascs_mobile/models/location/district.dart';
import 'package:aiascs_mobile/models/location/region.dart';
import 'package:aiascs_mobile/models/location/ward.dart';
import 'package:flutter/cupertino.dart';

class LocationState extends ChangeNotifier {
  List<Region> _regionList;
  List<String> _regionListString;
  Region _currentRegion;

  List<Region> get regionLists => _regionList ?? [];
  Region get currentRegion => _currentRegion;
  List<String> get regionListString =>
      _regionListString ?? ['Region', 'Loading..'];

  Future onGetRegions() async {
    _regionList = await LocationServices().GetRegion();
    addRegionToString(_regionList);
    notifyListeners();
  }

  void onCurrentRegions(Region region) {
    _currentRegion = region;
    notifyListeners();
  }

  void addRegionToString(List<Region> regions) {
    List<String> _data = ["Region"];
    regions.forEach((Region region) {
      _data.add(region.region_name);
      notifyListeners();
    });
    _regionListString = _data;
  }

  Future getSelectedRegion(String thisRegion) {
    regionLists.forEach((Region region) {
      if (region.region_name == thisRegion) {
        _currentRegion = region;
        addDistrictToString(region);
        notifyListeners();
      }
    });
  }

  District _currentDistrict;
  List<String> _districtListString;
  List<District> _districtList;

  List<District> get districtsLists => _districtList ?? [];
  District get currentDistrict => _currentDistrict;
  List<String> get districtListString =>
      _districtListString ?? ['District', 'Loading..'];

  Future onGetDistrict() async {
    _districtList = await LocationServices().GetDistrict();
    notifyListeners();
  }

  void onCurrentDistrict(District district) {
    _currentDistrict = district;

    notifyListeners();
  }

  void addDistrictToString(Region region) {
    List<String> _data = ["District"];
    districtsLists.forEach((District district) {
      if (region.region_code == district.region_code) {
        print(district.district_name);
        _data.add(district.district_name);
        notifyListeners();
      }
    });
    _districtListString = _data;
  }

  Future getSelectedDistrict(String thisDistrict) {
    _districtList.forEach((District district) {
      if (district.district_name == thisDistrict) {
        _currentDistrict = district;
        notifyListeners();
      }
    });
  }

  Ward _currentWard;
  List<String> _wardListString;
  List<Ward> _wardList;

  List<Ward> get wardsLists => _wardList ?? [];
  Ward get currentWard => _currentWard;
  List<String> get wardListString => _wardListString ?? ['Ward', 'Loading..'];

  Future onGetWard() async {
    _wardList = await LocationServices().GetWard();
    addWardToString(wardsLists);

    notifyListeners();
  }

  void onCurrentWard(Ward ward) {
    _currentWard = ward;
    notifyListeners();
  }

  void addWardToString(List<Ward> wards) {
    List<String> _data = ["Ward"];
    wards.forEach((Ward ward) {
      _data.add(ward.ward_name);
      notifyListeners();
    });

    _wardListString = _data;
  }

  // void addWardToString(District districts) {
  //   List<String> _data = ['Ward'];
  //   wardsLists.forEach((Ward ward) {
  //     if (districts.district_code == ward.ward_code) {
  //       print(ward.ward_name);
  //       _data.add(ward.ward_name);
  //       notifyListeners();
  //     }
  //     _wardListString = _data;
  //   });

  //   Future getSelectedWard(String thisward) {
  //     _wardList.forEach((Ward ward) {
  //       if (ward.ward_name == thisward) {
  //         _currentWard = ward;
  //         notifyListeners();
  //       }
  //     });
  //   }
  // }
}

