// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart' as sql;

// import '../models/todo_model.dart';

// class DBHelper {
//   static Future<void> createTable(sql.Database database) async {
//     await database.execute("CREATE TABLE todos("
//         "id INTEGER PRIMARY KEY AUTOINCREMENT,"
//         "title STRING, desc TEXT, date STRING,"
//         "startTime STRING, endTime STRING,"
//         "remind INTEGER, repeat STRING,"
//         "isCompleted INTEGER)");

//     await database.execute("CREATE TABLE users("
//         "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0,"
//         "isVerified INTEGER)");
//   }

//   // opening the database
//   static Future<sql.Database> db() async {
//     return sql.openDatabase('TodoApp', version: 1,
//         onCreate: (sql.Database database, int version) async {
//       await createTable(database);
//     });
//   }

//   static Future<int> createItem(Todo task) async {
//     final db = await DBHelper.db();

//     final id = await db.insert('todos ', task.toJson(),
//         conflictAlgorithm: sql.ConflictAlgorithm.replace);

//     return id;
//   }

// // getting items
//   static Future<List<Map<String, dynamic>>> getItems() async {
//     final db = await DBHelper.db();

//     return db.query('todos', orderBy: 'id');
//   }

// // gettin a single item
//   static Future<List<Map<String, dynamic>>> getItem(int id) async {
//     final db = await DBHelper.db();

//     return db.query('todos', where: "id = ?", whereArgs: [id], limit: 1);
//   }

// // update an item
//   static Future<int> updateItem(
//     int id,
//     String title,
//     String desc,
//     String tags,
//   ) async {
//     final db = await DBHelper.db();

//     final data = {
//       'title': title,
//       'desc': desc,
//       'date': tags,
//     };
//     final results =
//         await db.update('todos', data, where: "id = ?", whereArgs: [id]);

//     return results;
//   }

// // delete an item from the database
//   static Future<void> deleteItem(int id) async {
//     final db = await DBHelper.db();

//     try {
//       db.delete('todos', where: "id = ?", whereArgs: [id]);
//     } catch (e) {
//       debugPrint("Unable to delete $e from the database");
//       print(e);
//     }
//   }
// }
