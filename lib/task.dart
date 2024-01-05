import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // If _database is null, initialize it
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'doit.db');

    // Open the database
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      // Create the todo table
      await db.execute('''
        CREATE TABLE todo(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          information TEXT,
          important INTEGER,
          status INTEGER
        )
      ''');
    });
  }

  Future<void> insertTask(Map<String, dynamic> task) async {
    final Database db = await database;
    await db.insert('todo', task, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getImportantTasks() async {
    final Database db = await database;
    return await db.query('todo', where: 'important = ? AND status = ?', whereArgs: [1, 0]);
  }

  Future<List<Map<String, dynamic>>> getNonImportantTasks() async {
    final Database db = await database;
    return await db.query('todo', where: 'important = ? AND status = ?', whereArgs: [0, 0]);
  }

  Future<List<Map<String, dynamic>>> getDoneTasks() async {
    final Database db = await database;
    return await db.query('todo', where: 'status = ?', whereArgs: [1]);
  }

  Future<void> updateTaskStatusByName(String taskName, bool newStatus) async {
    final Database db = await database;
    await db.update('todo', {'status': newStatus ? 1 : 0}, where: 'name = ?', whereArgs: [taskName]);
  }

  Future<void> deleteTaskByName(String taskName) async {
    final Database db = await database;
    await db.delete('todo', where: 'name = ?', whereArgs: [taskName]);
  }
}
class Task {
  late String name;
  late String information;
  late bool important;
  late bool status;

  Task({
    required this.name,
    required this.information,
    required this.important,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'information': information,
      'important': important ? 1 : 0, // Store as 1 or 0 for boolean values
      'status': status ? 1 : 0, // Store as 1 or 0 for boolean values
    };
  }
}