import 'dart:async';

import 'package:aiascs_mobile/modules/authentication/login/auth_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 7);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new AuthHome()));
  
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
            Text("AIASCS Mobile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,))
          ],
        ),
      ),
    );
  }
}