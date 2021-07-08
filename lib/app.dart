
import 'package:aiascs_mobile/app_state/Init_state.dart';
import 'package:aiascs_mobile/app_state/Login_state.dart';
import 'package:aiascs_mobile/app_state/User_state.dart';
import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/feedback_state.dart';
import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/app_state/location_state.dart';
import 'package:aiascs_mobile/app_state/product_state.dart';
import 'package:aiascs_mobile/app_state/scan_qr_code_state.dart';
import 'package:aiascs_mobile/app_state/searching_state.dart';
import 'package:aiascs_mobile/app_state/unAuthorizedProduct_State.dart';
import 'package:aiascs_mobile/modules/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//
// Name: Danford Kija David
// Email: kijadanford@gmail.com,
// phoneNo: +255620419226
//  
// => "GROWING WITH AGILE"
//
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
          ChangeNotifierProvider(create: (_) => UserState()),
          ChangeNotifierProvider(create: (_) => ProductState()),
          ChangeNotifierProvider(create: (_) => UnAuthorizedProductState()),
          ChangeNotifierProvider(create: (_) => LanguageState()),             
          ChangeNotifierProvider(create: (_) => SearchingState()),             
          ChangeNotifierProvider(create: (_) => LocationState()), 
          ChangeNotifierProvider(create: (_) => FeedbackState()), 
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