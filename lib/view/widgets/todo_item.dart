import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controller/controller.dart';
import 'package:getx_sqflite/view/screens/edit_screen.dart';

class TodoItem extends StatelessWidget {
  TodoItem({super.key, required this.taskController, required this.index});

  final SQLController taskController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Spacer(),
                    Expanded(
                      child: Text(taskController.list[index].title),
                    ),
                    Expanded(
                      child: Text(taskController.list[index].time),
                    ),
                  ],
                ),
              ),
              Text(taskController.list[index].description),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      taskController.deleteData(
                          id: taskController.list[index].id);
                    },
                    icon: Icon(
                      Icons.delete_outlined,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      taskController.updateTaskData = true;
                      Get.to(
                        EditScreen(
                          id: taskController.list[index].id,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
