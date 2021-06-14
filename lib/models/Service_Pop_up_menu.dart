

import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicePopUpMenu {
  String id;
  String name;
  String translatedName;
  Color color;
  FontWeight fontWeight;

  ServicePopUpMenu({
    this.id,
    this.name,
    this.translatedName,
    this.color = const Color(0xFF1A3518),
    this.fontWeight = FontWeight.normal,
  });



 static List<ServicePopUpMenu>
      getDefaultServicePopUpMenus(BuildContext context) {
    return [
      ServicePopUpMenu(id: 'password', name: Provider.of<LanguageState>(context,listen: false).currentLanguage  == LanguageContant().english ? 'Change Password':"Baadili Nywila"),
      ServicePopUpMenu(id: 'sync', name:Provider.of<LanguageState>(context,listen: false).currentLanguage  == LanguageContant().english ? 'Sync' :"Fananisha Taarifa"),
      ServicePopUpMenu(id: 'language_setting', name: Provider.of<LanguageState>(context,listen: false).currentLanguage  == LanguageContant().english ? 'Change Language' :"Baadilisha Lugha"),
      ServicePopUpMenu(id: 'settings', name: Provider.of<LanguageState>(context,listen: false).currentLanguage  == LanguageContant().english ? 'Settings' :"Marekibisho"),
      ServicePopUpMenu(id: 'report', name: Provider.of<LanguageState>(context,listen: false).currentLanguage  == LanguageContant().english ?'Report':"Repoti"),
      ServicePopUpMenu(id: 'profile', name:Provider.of<LanguageState>(context,listen: false).currentLanguage  == LanguageContant().english ? 'Profiles' :"Taarifa Binafsi"),
      ServicePopUpMenu(id: 'logout', name:Provider.of<LanguageState>(context,listen: false).currentLanguage  == LanguageContant().english ?'Logout' :"Toka"),
      ServicePopUpMenu(id: 'faq', name:Provider.of<LanguageState>(context,listen: false).currentLanguage  == LanguageContant().english ?'FAQ' :"Maswali yakujua"),

    ];
  }

}