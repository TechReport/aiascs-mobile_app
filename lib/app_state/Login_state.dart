import 'package:aiascs_mobile/core/services/auth/Login_service.dart';
import 'package:aiascs_mobile/core/services/shared_preference/preference_provider.dart';
import 'package:flutter/foundation.dart';

class LoginState extends ChangeNotifier {
  bool _isLogin;
  String _loginMessage;
  bool _isAuth;

  bool get isLogin => _isLogin;
  String get loginMessage => _loginMessage ?? "";
  bool get isAuth => _isAuth ?? false;

  void setLogin(String email, String password) async {
    _isLogin = true;
    bool loginStatus = await LoginService().login(email, password);
    if (loginStatus) {
      _loginMessage = "You have Successfully Login";
      _isLogin = false;
      notifyListeners();
    } else {
      _loginMessage = "Repeat the authentication process again";
      _isLogin = false;
      notifyListeners();
    }
  }

  void checkAuth() async {
    String tokenValue = await PreferenceProvider.getPreferenceValue("token");
    if (tokenValue.length > 0) {
      _isAuth = true;
      notifyListeners();
    }    
  }
}
