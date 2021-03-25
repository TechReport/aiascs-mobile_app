import 'package:aiascs_mobile/modules/authentication/login/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthHome extends StatefulWidget {
  AuthHome({Key key}) : super(key: key);

  _AuthHomeState createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9FB9CC),
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 100.0),
              height: 500,
              child: Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 9),
                          color: Colors.transparent,
                          width: 40,
                          height: 40,
                          child: SvgPicture.asset("images/aiascs_logo.svg")),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 200.0),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Login()
                    //  )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
