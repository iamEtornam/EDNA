import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalStorage {
  Database? _database;
  final String table = 'history';
  final String dbName = 'enda_history.db';


  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await init();
    return _database!;
  }

  Future<String> get fullPath async {

    final path = await getDatabasesPath();
    return join(path, dbName);
  }

  Future<Database> init() async {
    final path = await fullPath;
    return await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
  }

  Future<void> create(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $table (id INTEGER PRIMARY KEY, text TEXT, sender TEXT, createdAt TEXT)');
  }

  Future<List<Map<String, Object?>>> loadHistories(Database db) async {
    List<Map<String, Object?>> records = await db.query(table);
    return records;
  }

  void clear() async {
    final path = await fullPath;
    await deleteDatabase(path);
  }
}
