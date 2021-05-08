import 'dart:convert';

import 'package:aiascs_mobile/core/services/http_service/http_service.dart';
import 'package:aiascs_mobile/core/services/shared_preference/preference_provider.dart';
import 'package:aiascs_mobile/core/services/user/User_service.dart';
import 'package:aiascs_mobile/models/User.dart';
import 'package:http/http.dart';

//
// Name: Danford Kija David
// Email: kijadanford@gmail.com,
// phoneNo: +255620419226
//  
// => "GROWING WITH AGILE"
//
class LoginService {
  Future<bool> login(String email, String password) async {
    final String loginUrl = "/api/v1/user/login";
    Map<String, dynamic> loginData = {
      "email": "$email",
      "password": "$password"
    };
    Response response =
        await HttpService().httpPost(loginUrl.trim(), loginData);
    if (response.statusCode == 200) {
      print(response.body);
      var responseData = json.decode(response.body);
      PreferenceProvider.setPreferenceValue(
          "token", responseData['user']['token']);
      userFromServer(responseData['user']);
      return true;
    }
    print(response.body);
    return false;
  }

  void userFromServer(Map<String, dynamic> json) {
    User user = User.fromJson(json);
    UserService.onSaveUserToOffline(user);
    PreferenceProvider.setPreferenceValue("userId", user.id);
  }

  Future<bool> changePassword(String password) async {
    final String loginUrl = "/api/v1/user/resetPassword";
    Map<String, dynamic> loginData = {"password": "$password"};

    Response response = await HttpService().htthPatch(
        loginUrl.trim(), loginData,
        token: await PreferenceProvider.getPreferenceValue("token"));
  
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print(responseData);
      // PreferenceProvider.setPreferenceValue(
      //     "token", responseData['data']['tempToken']);

      return true;
    }
    print(response.body);
    return false;
  }

  Future<bool> logout() async {
    final String loginUrl = "/api/v1/user/signout";
    Map<String, dynamic> loginData = {
      "_id": await PreferenceProvider.getPreferenceValue("userId")
    };

    Response response = await HttpService().httpPost(loginUrl.trim(), loginData,
        token: await PreferenceProvider.getPreferenceValue("token"));
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print(responseData);
      await PreferenceProvider.clearPreferences();
      return true;
    }
    print(response.body);
    return false;
  }
}
//UserService
