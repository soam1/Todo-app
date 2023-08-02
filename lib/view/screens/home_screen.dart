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
              icon: Icon(Icons.delete)),
        ],
        centerTitle: true,
      ),
    );
  }
}
