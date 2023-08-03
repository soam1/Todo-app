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

  void insertData({
    required String title,
    required String description,
    required String time,
  }) async {
    try {
      var insert = await database.insert("todo", {
        "title": title,
        "description": description,
        "time": time,
        "favorite": 0,
        "completed": 0,
      });
      debugPrint("Inserted data $insert");
      Get.back();
      getAllData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<TodoModel> list = [];

  void getAllData() async {
    list = [];
    var allData = await database.query("todo");
    for (var i in allData) {
      // debugPrint(i.toString());
      list.add(TodoModel.fromJson(i));
    }
    // debugPrint(list.length.toString());
    // debugPrint(allData.toString());
    update();
  }

  bool updateTaskData = false;

  void updateData({
    required String title,
    required String description,
    required String time,
    required int id,
  }) async {
    try {
      var updateData = await database.update(
          "todo",
          {
            "title": title,
            "description": description,
            "time": time,
            "favorite": 1,
            "completed": 1,
          },
          where: " id = $id");
      debugPrint("updated item $updateData");
      getAllData();
      Get.back();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteData({required int id}) async {
    var deletedItem = await database.delete("todo", where: "id = $id");
    debugPrint("deleted item $deletedItem");
    getAllData();
  }
}
