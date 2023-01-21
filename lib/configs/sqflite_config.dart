import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfLite {
  static const String dbName = 'todoDB.db';
  static const String tableTodo = 'todo_tb';

  static Database? database;

  static Future<void> init() async {
    var databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    if (await Directory(dirname(path)).exists()) {
      database = await openDatabase(
        path,
        version: 1,
        onOpen: (database) async {
          await _onOpenDatabase(database);
        },
      );
    }
  }

  static Future<void> _onOpenDatabase(Database database) async {
    await _createTodoTb(database);
  }

  static Future<void> _createTodoTb(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableTodo(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        label TEXT,
        is_active INTEGER
      )
      """);
  }

  static Future<int> insertTodo({required String label}) async {
    var databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    database = await openDatabase(
      path,
      version: 1,
      onOpen: (database) async {
        await _onOpenDatabase(database);
      },
    );
    int insertedId = await database!.insert(
      SqfLite.tableTodo,
      {
        'label': label,
        'is_active': 1,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return insertedId;
  }

  static Future<List<Map<String, dynamic>>> getTodo() async {
    var databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    database = await openDatabase(
      path,
      version: 1,
      onOpen: (database) async {
        await _onOpenDatabase(database);
      },
    );
    return await database!.query(SqfLite.tableTodo);
  }

  static Future<void> updateTodo({required Map<String, dynamic> data}) async {
    var databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    database = await openDatabase(
      path,
      version: 1,
      onOpen: (database) async {
        await _onOpenDatabase(database);
      },
    );

    await database!.update(
        SqfLite.tableTodo,
        {
          'label': data['label'],
          'is_active': data['is_active'],
        },
        where: 'id = ?',
        whereArgs: [data['id']]);
  }
}
