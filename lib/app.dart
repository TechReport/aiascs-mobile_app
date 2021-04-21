
import 'package:aiascs_mobile/app_state/Init_state.dart';
import 'package:aiascs_mobile/app_state/Login_state.dart';
import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/scan_qr_code_state.dart';
import 'package:aiascs_mobile/modules/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => InitState()),
           ChangeNotifierProvider(create: (_) => AppBarTitleState()),
           ChangeNotifierProvider(create: (_) => ScanQrCodeState()),
             ChangeNotifierProvider(create: (_) => LoginState()),
           //LoginState
        ],
        child:
    MaterialApp(
      title: 'AIASCS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen()
    ));
  }
}