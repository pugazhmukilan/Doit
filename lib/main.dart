import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import "Home.dart";
late SharedPreferences prefs ;
DBHelper db = DBHelper();
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  //obj for sahred preference
  prefs=await SharedPreferences.getInstance();
  
  
  /*Task newTask = Task(
  name: 'New Task',
  information: 'Some information about the task',
  important: true,
  status: false,
);
Task newTask1 = Task(
  name: 'New Task1',
  information: 'Some information about the task',
  important: true,
  status: false,
);
Map<String, dynamic> taskMap = newTask.toJson();
Map<String, dynamic> taskMap1 = newTask1.toJson();
await db.deleteTaskByName('New Task');

print("after deleteing =================================");
List<Map<String, dynamic>> pugazh5 = await db.getImportantTasks();
   print(pugazh5);*/


   

  
  runApp( MainApp());
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Home(),
      ),
    );
  }
}

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
  Future<List<Map<String, dynamic>>> getallUndoneTasks() async {
  final Database db = await database;
  return await db.query('todo', where: 'status = ?', whereArgs: [0]);
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

  Future<void> updatemakeitdone(String taskName) async {
    final Database db = await database;
    await db.update('todo', {'status': 1}, where: 'name = ?', whereArgs: [taskName]);
  }
  Future<void> updatemakeitundone(String taskName) async {
    final Database db = await database;
    await db.update('todo', {'status': 0}, where: 'name = ?', whereArgs: [taskName]);
  }

  Future<void> deleteTaskByName(String taskName) async {
    final Database db = await database;
    await db.delete('todo', where: 'name = ?', whereArgs: [taskName]);
  }
}
