import 'dart:async';
import 'package:aiascs_mobile/app_state/Login_state.dart';
import 'package:aiascs_mobile/app_state/User_state.dart';
import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/core/services/shared_preference/preference_provider.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:aiascs_mobile/modules/authentication/login/Login_Page.dart';
import 'package:aiascs_mobile/modules/home/home.dart';
// import 'package:aiascs_mobile/modules/splashscreen/Scan_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 7);
   await Provider.of<LanguageState>(context, listen: false)
        .setCurrentLanguage(language: LanguageContant().english);
          Provider.of<LanguageState>(context, listen: false).getCurrentLanguage();
    Provider.of<LoginState>(context, listen: false).checkAuth();
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    ///  await SocketSetup().socketConfig();
    if (Provider.of<LoginState>(context, listen: false).isAuth) {
      Provider.of<UserState>(context, listen: false).setCurrentUser(
          await PreferenceProvider.getPreferenceValue("userId"));
      //
      // Navigator.push(
      //     context,
      //     new MaterialPageRoute(
      //         builder: (context) => new  HomePage()));
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new Home(
                  selectedIndex:
                      Provider.of<AppBarTitleState>(context, listen: false)
                          .currentSelectedBottomBar)));
    } else {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new LoginPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageState>(
        builder: (BuildContext context, languageState, child) {
      return Scaffold(
        backgroundColor: Color(0xFF264653),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              Center(
                child: SvgPicture.asset(
                  "images/aiascs_logo.svg",
                  color: Color(0xFFFFFFFF),
                  height: 80,
                  width: 80,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 32,
              ),
           languageState.currentLanguage == LanguageContant().english ?    Text("AIASCS Mobile",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )) :   Text("AIASCS Simu",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),
      );
    });
  }
}
