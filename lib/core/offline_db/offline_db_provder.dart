import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OfflineDbProvider {
  final String databaseName = "aiascs_database";
  Database _db;
  // Script for migrations as well as intialization of tables
  final List<String> initialQuery = [
    "CREATE TABLE IF NOT EXISTS user (id TEXT PRIMARY KEY, firstName TEXT,lastName TEXT,email TEXT,phoneNumber TEXT,gender TEXT)",
  
  ];

  final List<String> migrationQuery = [];

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await init();
    this.onCreate(_db, migrationQuery.length + 1);
    return _db;
  }

  init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, '$databaseName.db');
    return await openDatabase(
      path,
      version: migrationQuery.length + 1,
      onUpgrade: onUpgrade,
      onCreate: onCreate,
    );
  }

  onCreate(Database db, int version) async {
    for (String query in initialQuery) {
      await db.execute(query);
    }
  }

  onUpgrade(Database db, int oldVersion, int version) async {
    for (String query in migrationQuery) {
      await db.execute(query);
    }
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}