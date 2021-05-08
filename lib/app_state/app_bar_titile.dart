import 'package:flutter/foundation.dart';

class AppBarTitleState extends ChangeNotifier {
//initstate
  String _appBarTitle;
  int _currenntSelectedBottomBar;

  String get appBarTitle => _appBarTitle ?? "Home";
  int get currentSelectedBottomBar => _currenntSelectedBottomBar ?? 1;

//reducer
  void setCurrentAppBarTitle(String currentAppBarTitle) {
    _appBarTitle = currentAppBarTitle;
    notifyListeners();
  }

  void setCurrentSelectedBottomBarIndex(int selectedIndex) {
    _currenntSelectedBottomBar = selectedIndex;
    notifyListeners();
  }
}
