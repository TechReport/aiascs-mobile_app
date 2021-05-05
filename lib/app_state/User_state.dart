import 'package:aiascs_mobile/core/services/user/User_service.dart';
import 'package:aiascs_mobile/models/User.dart';
import 'package:flutter/foundation.dart';

class UserState extends ChangeNotifier {
//init state
  User _currentUser;

//selector

  User get currentUser => _currentUser;

// reducer

  Future<void> setCurrentUser(String userId) async {
    User user = await UserService.onRetrieveUserFromOffline(userId);
    _currentUser = user;
    notifyListeners();
  }
}
