import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/todo_model.dart';

class SQLController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    createDatabase();
  }

  late Database database;

  void createDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    openAppDatabase(path: path);
  }

  void openAppDatabase({required String path}) async {
    // open the database
    await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT, time TEXT, description TEXT, favorite INTEGER, completed INTEGER)');
      },
      onOpen: (Database db) {
        database = db;
        getAllData();
        debugPrint("database is just opened");
      },
    );
  }

  void deleteTheDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    await deleteDatabase(path);
    debugPrint("db deleted");
  }

  void insertData() async {
    var insert = await database.insert("todo", {
      "title": "dsa",
      "description": "3 striver ques daily",
      "time": "10pm",
      "favorite": 0,
      "completed": 0,
    });
    debugPrint("Inserted a row in table $insert");

    getAllData();
  }

  List<TodoModel> list = [];

  void getAllData() async {
    var allData = await database.query("todo");
    for (var i in allData) {
      debugPrint(i.toString());
      list.add(TodoModel.fromJson(i));
    }
    debugPrint(list.length.toString());
    debugPrint(allData.toString());
    update();
  }

  void updateData() async {
    var updateData = await database.update(
        "todo",
        {
          "title": "workout",
          "description": "2 hours body",
          "time": "6am",
          "favorite": 1,
          "completed": 0,
        },
        where: " id = ${1}");
    debugPrint("updated item $updateData");
    getAllData();
  }

  void deleteData() async {
    var deletedItem = await database.delete("todo", where: "id = ${1}");
    debugPrint("deleted item $deletedItem");
    getAllData();
  }
}
