
import 'package:aiascs_mobile/core/offline_db/user/user_offline_provider.dart';
import 'package:aiascs_mobile/models/User.dart';

class UserService {

  static Future<User> onRetrieveUserFromOffline(String userId) async {
    User user;
    user = await UserOfflineProvider().getUser(userId);
    return user;
  }

  static void onSaveUserToOffline(User user) async {
    UserOfflineProvider().addOrUpdateUser(user);
  }

// on delete user after logout by user id


}