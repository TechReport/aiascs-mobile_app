import 'package:aiascs_mobile/modules/home/components/bottom_navigation_bar_options.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static String label = "Home";

  // index of the current page
  int _selectedindex = 1;

  // update the currrent page
  // ignore: non_constant_identifier_names
  void _update_page(int value) {
    setState(() {
      _selectedindex = value;
    });
  }

  // list of bottom bar options
  List<String> _bottomBarList = ["Library", "AudioBook", "PodCast", "Search"];

  // modules to display
  List<Widget> _widgetOptions = [
    Text("1"),
    Text("2"),
    Text("3"),
    Text("4"),
  ];

  @override
  Widget build(BuildContext context) {
    // Current bottom bar label
    String label = _bottomBarList[_selectedindex];

    return Scaffold(
       appBar: AppBar(title: Text("Home")) ,
        body: _widgetOptions.elementAt(_selectedindex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:  Color(0xFF9FB9CC),
          selectedIconTheme: IconThemeData(
            color: Color(0xfff2f2f2),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.white
          ),
          selectedLabelStyle: TextStyle(
            color: Colors.white,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(
            color:  Color(0xfff2f2f2).withOpacity(0.5)
                
          ),
          // fixedColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          items: BottomNavigationOptions.navigationOptions,
          currentIndex: _selectedindex,
          onTap: _update_page,
        ),
      );
  }
}