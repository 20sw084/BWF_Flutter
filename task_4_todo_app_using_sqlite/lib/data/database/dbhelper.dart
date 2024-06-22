import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_now/data/model/task_data.dart';

class DatabaseHelper {
  static final databaseName = 'task.db';
  static final databaseVersion = 1;
  static final table = "my_task";

  static final columnID = 'id';
  static final columnTitle = 'title';
  static final columnTaskType = 'type';
  static final columnDescription = 'description';
  static final columnCategory = 'category';

  static Database? _database;

  DatabaseHelper.privateConstructoe();
  static final DatabaseHelper instance = DatabaseHelper.privateConstructoe();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, databaseName);
    return await openDatabase(path,
        version: databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnID INTEGER PRIMARY KEY,
        $columnTitle TEXT NOT NULL,
        $columnTaskType TEXT NOT NULL,
        $columnDescription TEXT NOT NULL,
        $columnCategory TEXT NOT NULL
      )
''');
  }

  // Insert data into database
  Future<TaskData> insert(TaskData taskData) async {
    print(taskData.toMap());
    Database? db = await instance.database;
    await db!.insert(table, taskData.toMap());
    return taskData;
  }

  // fetch data from database
  Future<List<TaskData>> getData() async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>> result = await db!.query(table);
    return List.generate(result.length, (index) {
      return TaskData(
        title: result[index]['title'],
        type: result[index]['type'],
        description: result[index]['description'],
        category: result[index]['category'],
      );
    });
  }
}
