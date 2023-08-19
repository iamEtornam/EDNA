import 'package:sqflite/sqflite.dart';

class LocalStorage {
  init() async {
    // Get a location using getDatabasesPath
    final databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    // open the database
    Database database =
        await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });
  }

  clear() async {
    // Delete the database
    await deleteDatabase(path);
  }
}
