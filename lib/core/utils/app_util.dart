import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:aiascs_mobile/modules/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AppUtil {
  static showToastMessage(
      {String message, ToastGravity position = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: position,
        backgroundColor: Color(0xFF656565));
  }

  static onShowLanguageProfile(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 16,
                color: Color(0xFF264653),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        Provider.of<LanguageState>(context, listen: false)
                                    .currentLanguage ==
                                LanguageContant().english
                            ? "Language Profile"
                            : "Chagua Lugha",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: Text("🇹🇿"),
                title: new Text('Swahili'),
                onTap: () async {
                  await Provider.of<LanguageState>(context, listen: false)
                      .setCurrentLanguage(language: LanguageContant().swahili);

                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new SplashScreen()));
                },
              ),
              ListTile(
                leading: Text("🇺🇲"),
                title: new Text('English'),
                onTap: () async {
                  await Provider.of<LanguageState>(context, listen: false)
                      .setCurrentLanguage(language: LanguageContant().english);

                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new  SplashScreen()));
                },
              ),
            ],
          );
        });
  }

  static showPopUpModal(
      BuildContext context, Widget modal, bool diablePadding) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            child: Container(
              child: Padding(
                padding: diablePadding
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.only(
                        bottom: 12, top: 5, right: 5, left: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                height: 22,
                                width: 22,
                                child: Icon(Icons.close_fullscreen_sharp),
                              ),
                            )
                          ],
                        ),
                      ),
                      modal
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
