import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfLite {
  static const String dbName = 'todoDB.db';
  static const String tableTodo = 'todo_tb';

  static Database? database;

  SqfLite._privateConstructor();

  static final SqfLite instance = SqfLite._privateConstructor();

  Future<void> init() async {
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

  Future<void> _onOpenDatabase(Database database) async {
    await _createTodoTb(database);
  }

  Future<void> _createTodoTb(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableTodo(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        label TEXT,
        is_active INTEGER
      )
      """);
  }

  Future<int> insertTodo({required String label}) async {
    var databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    database = await openDatabase(
      path,
      version: 1,
      onOpen: (database) async {
        await _onOpenDatabase(database);
      },
    );
    int insertedId = await SqfLite.database!.insert(
      SqfLite.tableTodo,
      {
        'label': label,
        'is_active': 1,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return insertedId;
  }

  Future<List<Map<String, dynamic>>> getTodo() async {
    var databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    database = await openDatabase(
      path,
      version: 1,
      onOpen: (database) async {
        await _onOpenDatabase(database);
      },
    );
    return await SqfLite.database!.query(SqfLite.tableTodo);
  }

  Future<void> updateTodo({required Map<String, dynamic> data}) async {
    var databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    database = await openDatabase(
      path,
      version: 1,
      onOpen: (database) async {
        await _onOpenDatabase(database);
      },
    );

    await SqfLite.database!.update(
        SqfLite.tableTodo,
        {
          'label': data['label'],
          'is_active': data['is_active'],
        },
        where: 'id = ?',
        whereArgs: [data['id']]);
  }
}
