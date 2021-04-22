

import 'package:flutter/material.dart';

class ServicePopUpMenu {
  String id;
  String name;
  String translatedName;
  Color color;
  FontWeight fontWeight;

  ServicePopUpMenu({
    this.id,
    this.name,
    this.translatedName,
    this.color = const Color(0xFF1A3518),
    this.fontWeight = FontWeight.normal,
  });



 static List<ServicePopUpMenu>
      getDefaultServicePopUpMenus() {
    return [
      ServicePopUpMenu(id: 'logout', name: 'Logout'),
      ServicePopUpMenu(id: 'password', name: 'Change Password'),
      ServicePopUpMenu(id: 'sync', name: 'Sync'),
      ServicePopUpMenu(id: 'language_setting', name: 'Language Settings'),
      ServicePopUpMenu(id: 'settings', name: 'Settings'),
      ServicePopUpMenu(id: 'report', name: 'Report'),
      ServicePopUpMenu(id: 'profile', name: 'Profiles'),
      ServicePopUpMenu(id: 'password', name: 'Change Password'),
    ];
  }

}