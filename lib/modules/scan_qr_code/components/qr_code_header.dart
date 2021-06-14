import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/core/components/Line_separator.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QRCodeHeader extends StatelessWidget {
  const QRCodeHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        padding: EdgeInsets.symmetric(vertical: 0),
        color:  Color(0xFF264653),
        child: Column(
          children: [
            LineSeperator(
              color: Colors.grey,
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("       "),
                Text(Provider.of<LanguageState>(context,listen: false).currentLanguage == LanguageContant().english ?"Product Profile" :"Taarifa Za Bidhaa",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300)),
            
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            LineSeperator(
              color: Colors.grey,
              height: 1,
            )
          ],
        ));
  }
}
