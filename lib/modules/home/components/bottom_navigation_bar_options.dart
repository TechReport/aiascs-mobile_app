import 'package:flutter/material.dart';

class BottomNavigationOptions {
  // List of bottom navigation options

  static final List<BottomNavigationBarItem> navigationOptions = [
    BottomNavigationBarItem(
      icon: Icon(Icons.deck),
      activeIcon: Icon(Icons.deck),
      label: "Services",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.headset),
      activeIcon: Icon(Icons.headset_outlined),
      label: "AudioBook",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.mic),
      activeIcon: Icon(Icons.mic_outlined),
      label: "PodCast",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      activeIcon: Icon(Icons.search_outlined),
      label: "Search",
    ),
  ];
}