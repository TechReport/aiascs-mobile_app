import 'package:aiascs_mobile/core/services/auth/Login_service.dart';
import 'package:aiascs_mobile/core/services/shared_preference/preference_provider.dart';
import 'package:flutter/foundation.dart';

class LoginState extends ChangeNotifier {
  bool _isLogin;
  String _loginMessage;
  bool _isAuth;
  bool _isLoading;
  bool _isLogout;

  bool get isLogin => _isLogin ?? false;
  String get loginMessage => _loginMessage ?? "";
  bool get isAuth => _isAuth ?? false;
  bool get isLoading => _isLoading ?? false;
  bool get isLogout => _isLogout ?? false;

  Future<void> setLogin(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    bool loginStatus = await LoginService().login(email, password);
    if (loginStatus) {
      _loginMessage = "You have Successfully Login";
      _isLoading = false;
      _isLogin = true;
      notifyListeners();
    } else {
      _loginMessage = "Repeat the authentication process again";
      _isLoading = false;
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

  void changePassword(String password) async {
    _isLoading = true;
    notifyListeners();
    if (await LoginService().changePassword(password)) {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() async {
    _isLoading = true;
    if (await LoginService().logout()) {
      _isLogout = true;
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearStates() {
    _isLoading = false;
    notifyListeners();
  }
}
