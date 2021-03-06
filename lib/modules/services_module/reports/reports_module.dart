import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:aiascs_mobile/modules/home/components/bottom_navigation_bar_options.dart';
import 'package:aiascs_mobile/modules/home/home.dart';
import 'package:aiascs_mobile/modules/services_module/reports/All_Reports/AllReports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

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
  DateTime filterDate;
  // CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _selectedindex = Provider.of<AppBarTitleState>(context, listen: false)
        .currentSelectedBottomBar;
    tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
    // _controller = CalendarController();
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
           
            elevation: 0,
            title: Text(Provider.of<AppBarTitleState>(context, listen: false)
                .appBarTitle),
            backgroundColor: Color(0xFF264653),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Provider.of<AppBarTitleState>(context, listen: false)
                    .setCurrentAppBarTitle(
                        Provider.of<LanguageState>(context, listen: false)
                                    .currentLanguage ==
                                LanguageContant().english
                            ? "Home"
                            : "Nyumbani");
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
                Tab(
                    text: Provider.of<LanguageState>(context, listen: false)
                                .currentLanguage ==
                            LanguageContant().english
                        ? "All"
                        : "Zote"),
                Tab(
                    text: Provider.of<LanguageState>(context, listen: false)
                                .currentLanguage ==
                            LanguageContant().english
                        ? "Week 1"
                        : "Wiki 1"),
                Tab(
                    text: Provider.of<LanguageState>(context, listen: false)
                                .currentLanguage ==
                            LanguageContant().english
                        ? "Week 2"
                        : "Wiki 3"),
                Tab(
                    text: Provider.of<LanguageState>(context, listen: false)
                                .currentLanguage ==
                            LanguageContant().english
                        ? "Week 3"
                        : "Wiki 3"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AllReports(),
              AllReports(),
              Center(
                child: Container(
                  child: Text(Provider.of<LanguageState>(context, listen: false)
                              .currentLanguage ==
                          LanguageContant().english
                      ? "No data for this week"
                      : "Hakuna Taarifa za hii wiki"),
                ),
              ),
              Center(
                child: Container(
                  child: Text(Provider.of<LanguageState>(context, listen: false)
                              .currentLanguage ==
                          LanguageContant().english
                      ? "No data for this week"
                      : "Hakuna Taarifa za hii wiki"),
                ),
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
