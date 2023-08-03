import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controller/controller.dart';
import 'package:getx_sqflite/view/screens/edit_screen.dart';
import 'package:getx_sqflite/view/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final taskController = Get.put(SQLController());

  final SQLController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => EditScreen(), transition: Transition.downToUp);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<SQLController>(
        builder: (taskController) => ListView.builder(
          itemCount: taskController.list.length,
          itemBuilder: (context, index) =>
              TodoItem(taskController: taskController, index: index),
        ),
      ),
    );
  }
}
