import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/feedback_state.dart';
import 'package:aiascs_mobile/models/feedback.dart';
import 'package:aiascs_mobile/modules/home/components/bottom_navigation_bar_options.dart';
import 'package:aiascs_mobile/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({Key key}) : super(key: key);

  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  int _selectedindex;

  @override
  void initState() {
    super.initState();
      Provider.of<FeedbackState>(context, listen: false).onGetFeedbacksFromServer();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentSelectedBottomBarIndex(0);
    _selectedindex = Provider.of<AppBarTitleState>(context, listen: false)
        .currentSelectedBottomBar;
    // ignore: non_constant_identifier_names
    int productCount = 0;
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

    return Consumer<FeedbackState>(
        builder: (BuildContext context, feedbackState, child) {
      int count = 0;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF264653),
          title: Text(Provider.of<AppBarTitleState>(context, listen: false)
              .appBarTitle),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Provider.of<AppBarTitleState>(context, listen: false)
                  .setCurrentAppBarTitle("Home");
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new Home(
                          selectedIndex: Provider.of<AppBarTitleState>(context,
                                  listen: false)
                              .currentSelectedBottomBar)));
            },
          ),
        ),
        body:  ListView(
          children:
              feedbackState.feedbackModel.map((FeedbackModel feedbackModel) {
            count++;
            return Card(
              color: Colors.white,
              elevation: 8.0,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  height: 126,
                  width: 350,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(
                            leading: const Icon(Icons.people,size: 30,),
                            title: Text( "Feedback & Verification No:"+ count.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                )),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text( "Messages",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                                 Text(feedbackModel.message,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ))
                              ],
                            ),
                            
                           
                            onTap: () => print("ListTile"))
                      ])),
            );
          }).toList(),
        ),
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
          currentIndex: _selectedindex,
          onTap: _update_page,
        ),
      );
    });
  }
}
