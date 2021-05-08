import 'package:shared_preferences/shared_preferences.dart';

//
// Name: Danford Kija David
// Email: kijadanford@gmail.com,
// phoneNo: +255620419226
//  
// => "GROWING WITH AGILE"
//
class PreferenceProvider {
  static setPreferenceValue(String preferenceKey, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(preferenceKey, value);
  }

  static Future<String> getPreferenceValue(
    String preferenceKey,
  ) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(preferenceKey) ?? null;
  }

  static Future<bool> clearPreferences() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
    return true;
  }
}
