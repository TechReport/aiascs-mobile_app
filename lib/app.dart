
import 'package:aiascs_mobile/app_state/Init_state.dart';
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