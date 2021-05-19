import 'package:aiascs_mobile/app_state/Login_state.dart';
import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/searching_state.dart';
import 'package:aiascs_mobile/core/components/pop_up_menu_component.dart';
import 'package:aiascs_mobile/core/utils/app_util.dart';
import 'package:aiascs_mobile/modules/authentication/change_password/Change_Password.dart';
import 'package:aiascs_mobile/modules/authentication/login/Login_Page.dart';
import 'package:aiascs_mobile/modules/home/components/bottom_navigation_bar_options.dart';
import 'package:aiascs_mobile/modules/scan_qr_code/scan_Qr_Code.dart';
import 'package:aiascs_mobile/modules/searching/search.dart';
import 'package:aiascs_mobile/modules/services_module/Service_Home.dart';
import 'package:aiascs_mobile/modules/unauthenticated_product/Unauthenticated_Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  int selectedIndex;
  Home({this.selectedIndex});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // index of the current page
  //int _selectedindex = 0;

  // update the currrent page
  // ignore: non_constant_identifier_names
  void _update_page(int value) {
    setState(() {
      widget.selectedIndex = value;
    });

    switch (widget.selectedIndex) {
      case 3:
        Provider.of<AppBarTitleState>(context, listen: false)
            .setCurrentAppBarTitle("Searching");
        Provider.of<AppBarTitleState>(context, listen: false)
            .setCurrentSelectedBottomBarIndex(3);
        break;
      case 1:
        Provider.of<SearchingState>(context, listen: false).searchStatus(false);
        Provider.of<AppBarTitleState>(context, listen: false)
            .setCurrentAppBarTitle("Scan QR code");
        Provider.of<AppBarTitleState>(context, listen: false)
            .setCurrentSelectedBottomBarIndex(1);
        break;
      case 2:
         Provider.of<SearchingState>(context, listen: false).searchStatus(false);
        Provider.of<AppBarTitleState>(context, listen: false)
            .setCurrentAppBarTitle("UnAouthirised Product");
        Provider.of<AppBarTitleState>(context, listen: false)
            .setCurrentSelectedBottomBarIndex(2);
        break;
      default:
              Provider.of<SearchingState>(context, listen: false).searchStatus(false);

        Provider.of<AppBarTitleState>(context, listen: false)
            .setCurrentAppBarTitle("Home");
        Provider.of<AppBarTitleState>(context, listen: false)
            .setCurrentSelectedBottomBarIndex(0);
    }
  }

  // modules to display
  List<Widget> _widgetOptions = [
    ServiceHome(),
    ScanQrCode(),
    UnAuthenticatedProduct(),
    Search(),
  ];

  void onOpenMoreMenu() async {
    String response =
        await AppUtil.showPopUpModal(context, PopUpMenuComponent(), false);
    switch (response) {
      case "logout":
        Provider.of<LoginState>(context, listen: false).clearStates();
        Provider.of<LoginState>(context, listen: false).logout();
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(builder: (context) => new LoginPage()));
        break;
      case "password":
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new ChangePassword()));

        break;
      default:
        print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Text(""),
          elevation: 0,
          title: Text(Provider.of<AppBarTitleState>(context, listen: false)
              .appBarTitle),
          backgroundColor: Color(0xFF264653),
          actions: [
            GestureDetector(
              child: Icon(Icons.more_vert),
              onTap: () => onOpenMoreMenu(),
            )
          ],
        ),
        body:  _widgetOptions.elementAt(   widget.selectedIndex ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF264653),
          selectedIconTheme: IconThemeData(
            color: Color(0xfff2f2f2),
          ),
          unselectedIconTheme: IconThemeData(color: Colors.white),
          selectedLabelStyle: TextStyle(
            color: Colors.white,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle:
              TextStyle(color: Color(0xfff2f2f2).withOpacity(0.5)),
          fixedColor: Colors.yellow,
          type: BottomNavigationBarType.fixed,
          items: BottomNavigationOptions.navigationOptions,
          currentIndex:    widget.selectedIndex ,
          onTap: _update_page,
        ),
      
    );
  }
}
