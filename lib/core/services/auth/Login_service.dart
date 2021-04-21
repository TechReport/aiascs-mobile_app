import 'dart:convert';

import 'package:aiascs_mobile/core/services/http_service/http_service.dart';
import 'package:aiascs_mobile/core/services/shared_preference/preference_provider.dart';
import 'package:http/http.dart';

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
      var responseData = json.decode(response.body);
      print(responseData['data']['tempToken']);
      PreferenceProvider.setPreferenceValue(
          "token", responseData['data']['tempToken']);
      return true;
    }
    print(response.body);
    return false;
  }
}
