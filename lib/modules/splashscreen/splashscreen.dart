import 'dart:async';
import 'package:aiascs_mobile/app_state/Login_state.dart';
import 'package:aiascs_mobile/app_state/User_state.dart';
import 'package:aiascs_mobile/core/services/notification_service/socket_setup.dart';
import 'package:aiascs_mobile/core/services/shared_preference/preference_provider.dart';
import 'package:aiascs_mobile/modules/authentication/login/Login_Page.dart';
import 'package:aiascs_mobile/modules/home/home.dart';
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
    Provider.of<LoginState>(context, listen: false).checkAuth();
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    await SocketSetup().socketConfig();
    if (Provider.of<LoginState>(context, listen: false).isAuth) {
  
      Provider.of<UserState>(context, listen: false).setCurrentUser(await PreferenceProvider.getPreferenceValue("userId"));

      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Home()));
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
    return Scaffold(
      backgroundColor: Color(0xFF9FB9CC),
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
            Text("AIASCS Mobile",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }
}
