import 'package:aiascs_mobile/core/offline_db/offline_db_provder.dart';
import 'package:aiascs_mobile/models/User.dart';
import 'package:sqflite/sqflite.dart';

class UserOfflineProvider extends OfflineDbProvider {
  //columns
  String table = "user";
  String id = "id";
  String firstname = "firstName";
  String lastname = "lastName";
  String email = "email";
  String phonenumber = "phoneNumber";
  String gender = "gender";

  addOrUpdateUser(User user) async {
    var dbClient = await db;
    await dbClient.insert(table, user.toOffline(user),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteuser(String userId) async {
    var dbClient = await db;
    return await dbClient.delete(table, where: '$id = ?', whereArgs: [userId]);
  }

  Future<User> getUser(String userId) async {
    User offlineUser;
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        where: '$id = ?',
        whereArgs: [userId],
        columns: [id, firstname, lastname, email, phonenumber, gender],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          User newUser = User.fromOffline(map);
          offlineUser = newUser;
        }
      }
    } catch (e) {}
    return offlineUser;
  }
}
