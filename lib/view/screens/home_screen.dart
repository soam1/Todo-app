import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controller/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(SQLController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app"),
        actions: [
          IconButton(
            onPressed: () {
              controller.deleteTheDatabase();
            },
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              controller.insertData();
            },
            icon: Icon(Icons.add),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                controller.updateData();
              },
              icon: Icon(Icons.update_sharp)),
          IconButton(
              onPressed: () {
                controller.deleteData();
              },
              icon: Icon(Icons.folder_delete_outlined)),
        ],
      ),
    );
  }
}
