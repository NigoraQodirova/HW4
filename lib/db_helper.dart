import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String dbName = 'user_database.db';
  static const String tableName = 'users';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, dbName);

    return await openDatabase(databasePath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            firstName TEXT,
            lastName TEXT,
            email TEXT
          )
          ''');
    });
  }

  Future<void> insertUsers(List<Map<String, dynamic>> users) async {
    final Database db = await database;
    await db.transaction((txn) async {
      users.forEach((user) async {
        print(user);
        await txn.rawInsert('''
            INSERT INTO $tableName(firstName, lastName, email)
            VALUES("${user['name']['first']}", "${user['name']['last']}", "${user['email']}")
            ''');
      });
    });
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final Database db = await database;
    return await db.query(tableName);
  }
}
