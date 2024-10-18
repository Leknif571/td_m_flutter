import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DbInstance {
  // Création de la base de donnée favourite.db
  static Future<Database> database() async {
    final String inMemoryDatabasePath =
        path.join(await getDatabasesPath(), "favourite.db");
    return openDatabase(inMemoryDatabasePath, version: 1, onCreate: _onCreate);
  }

  // Création de la table favourite

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE favourite (
      id INTEGER PRIMARY KEY,
      number INTEGER
    )
    ''');
  }
}
