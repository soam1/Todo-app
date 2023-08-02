import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    createDatabase();
  }

  void createDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    openAppDatabase(path: path);
  }

  void openAppDatabase({required String path}) async {
    // open the database
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT, time TEXT, description TEXT, favorite INTEGER, completed INTEGER)');
      },
      onOpen: (Database database) {
        debugPrint("database is just opened");
      },
    );
  }

  void deleteTheDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    await deleteDatabase(path);
    print("db deleted");
  }

  void getAllData() {}
  void insertData() {}
}
