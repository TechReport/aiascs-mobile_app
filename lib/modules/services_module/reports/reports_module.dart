import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/modules/home/components/bottom_navigation_bar_options.dart';
import 'package:aiascs_mobile/modules/home/home.dart';
import 'package:aiascs_mobile/modules/services_module/reports/All_Reports/AllReports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//
// Name: Danford Kija David
// Email: kijadanford@gmail.com,
// phoneNo: +255620419226
//
// => "GROWING WITH AGILE"
//
class ReportModule extends StatefulWidget {
  @override
  _ReportModuleState createState() => _ReportModuleState();
}

class _ReportModuleState extends State<ReportModule>
    with SingleTickerProviderStateMixin {
  int _selectedindex;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    _selectedindex = Provider.of<AppBarTitleState>(context, listen: false)
        .currentSelectedBottomBar;
    tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    void _update_page(int value) {
      setState(() {
        _selectedindex = value;
      });
      Provider.of<AppBarTitleState>(context, listen: false)
          .setCurrentSelectedBottomBarIndex(_selectedindex);
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new Home(
                  selectedIndex:
                      Provider.of<AppBarTitleState>(context, listen: false)
                          .currentSelectedBottomBar)));
    }

    return DefaultTabController(
        // The number of tabs to display.
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  onPressed: () {                    
                  })
            ],
            elevation: 0,
            title: Text(Provider.of<AppBarTitleState>(context, listen: false)
                .appBarTitle),
            backgroundColor: Color(0xFF264653),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Provider.of<AppBarTitleState>(context, listen: false)
                    .setCurrentAppBarTitle("Home");
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Home(
                            selectedIndex: Provider.of<AppBarTitleState>(
                                    context,
                                    listen: false)
                                .currentSelectedBottomBar)));
              },
            ),
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorWeight: 3.0,
              tabs: [
                Tab(text: "All"),
                Tab(text: "Week 1"),
                Tab(text: "Week 2"),
                Tab(text: "Week 3"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AllReports(),
                 AllReports(),
              Center(
                child: Container(child: 
                Text("No data for this week"),),
              ),            
              Center(
                child: Container(child: 
                Text("No data for this week"),),
              ),
            ],
          ),
          // Complete this code in the next step.

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
            unselectedLabelStyle: TextStyle(color: Color(0xFFFFFFFF)),
            fixedColor: Colors.yellow,
            type: BottomNavigationBarType.fixed,
            items: BottomNavigationOptions.navigationOptions,
            currentIndex: _selectedindex,
            onTap: _update_page,
          ),
        ));
  }
}
