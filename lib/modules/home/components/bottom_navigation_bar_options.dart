import 'package:flutter/material.dart';

class BottomNavigationOptions {
  // List of bottom navigation options

  static final List<BottomNavigationBarItem> navigationOptions = [
    BottomNavigationBarItem(
      icon: Icon(Icons.sensor_window_sharp),
      activeIcon: Icon(Icons.sensor_window_sharp),
      label: "Services",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.qr_code_scanner_rounded),
      activeIcon: Icon(Icons.qr_code_scanner_rounded),
      label: "QrScan",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt),
      activeIcon: Icon(Icons.camera_alt),
      label: "UnAuthorized Product",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      activeIcon: Icon(Icons.search),
      label: "Search",
    ),
  ];
}