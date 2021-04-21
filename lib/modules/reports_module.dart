import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/core/components/enter_token_button.dart';
import 'package:aiascs_mobile/core/components/spacer_component.dart';
import 'package:aiascs_mobile/models/scan_product_profile.dart';
import 'package:aiascs_mobile/modules/home/components/bottom_navigation_bar_options.dart';
import 'package:aiascs_mobile/modules/scan_qr_code/components/qr_code_header.dart';
import 'package:aiascs_mobile/modules/scan_qr_code/scan_Qr_Code.dart';
import 'package:aiascs_mobile/modules/services_module/Service_Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportModule extends StatefulWidget {
  @override
  _ReportModuleState createState() => _ReportModuleState();
}

class _ReportModuleState extends State<ReportModule> {
  int _selectedindex;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentSelectedBottomBarIndex(1);
    _selectedindex = Provider.of<AppBarTitleState>(context, listen: false)
        .currentSelectedBottomBar;
  }

  @override
  Widget build(BuildContext context) {
    void _update_page(int value) {
      setState(() {
        _selectedindex = value;
      });

      switch (_selectedindex) {
        case 3:
          Provider.of<AppBarTitleState>(context, listen: false)
              .setCurrentAppBarTitle("Searching");
          Provider.of<AppBarTitleState>(context, listen: false)
              .setCurrentSelectedBottomBarIndex(3);

          break;
        case 1:
          Provider.of<AppBarTitleState>(context, listen: false)
              .setCurrentAppBarTitle("Scan QR code");
          Provider.of<AppBarTitleState>(context, listen: false)
              .setCurrentSelectedBottomBarIndex(1);
          break;
        case 2:
          Provider.of<AppBarTitleState>(context, listen: false)
              .setCurrentAppBarTitle("UnAouthirised Product");
          Provider.of<AppBarTitleState>(context, listen: false)
              .setCurrentSelectedBottomBarIndex(2);
          break;
        default:
          Provider.of<AppBarTitleState>(context, listen: false)
              .setCurrentAppBarTitle("Home");
          Provider.of<AppBarTitleState>(context, listen: false)
              .setCurrentSelectedBottomBarIndex(0);
      }
    }

    List<Widget> _widgetOptions = [
      ServiceHome(),
      ScanQrCode(),
      Text("3"),
      Text("4"),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF9FB9CC)),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => new ScanQrCode()),
                (route) => false);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
 Scaffold(
          appBar: AppBar(
            title: Text('Fixed Tabs'),
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff5808e5),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'DOGS', icon: Icon(Icons.favorite)),
                Tab(text: 'CATS', icon: Icon(Icons.music_note)),
                Tab(text: 'BIRDS', icon: Icon(Icons.search)),
              ],
            ),
          ),
          body: TabBarView(
            controller:tabController ,
            children: [
                Center(child: Text('DOGS')),
                Center(child: Text('CATS')),
                Center(child: Text('BIRDS')),
            ],
          ),
        ),


          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF9FB9CC),
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
        currentIndex: _selectedindex,
        onTap: _update_page,
      ),
    );
  }
}
