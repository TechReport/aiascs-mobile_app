import 'package:aiascs_mobile/core/services/shared_preference/preference_provider.dart';
import 'package:flutter/foundation.dart';

class LanguageState extends ChangeNotifier {

  //initState
  String _currentLanguage;
  String lugha = "language";
  //selector
  String get currentLanguage => _currentLanguage ?? "";

  //reducer
  void setCurrentLanguage({@required String language}) {
    PreferenceProvider.setPreferenceValue(lugha, language);
  }

  void getCurrentLanguage() async {
    _currentLanguage = await PreferenceProvider.getPreferenceValue(lugha);
    notifyListeners();
  }
}
