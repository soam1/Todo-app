import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controller/controller.dart';
import 'package:getx_sqflite/shared/custom_text_form_field.dart';

class EditScreen extends StatefulWidget {
  EditScreen({super.key, this.id, this.title, this.time, this.desc});

  final int? id;
  final String? title;
  final String? time;
  final String? desc;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final titleController = TextEditingController();

  final timeController = TextEditingController();

  final descController = TextEditingController();

  // final controller = Get.put(SQLController());
  final SQLController controller = Get.find();

  @override
  void initState() {
    if (controller.updateTaskData) {
      titleController.text = widget.title.toString();
      timeController.text = widget.time.toString();
      descController.text = widget.desc.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.updateTaskData ? "update Data" : "Add data"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Title"),
          CustomTextFormField(
              validationText: "Please add title", controller: titleController),
          Text("Time"),
          CustomTextFormField(
              validationText: "Please add time", controller: timeController),
          Text("Description"),
          CustomTextFormField(
              validationText: "Please add description",
              controller: descController),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MaterialButton(
              onPressed: () {
                if (controller.updateTaskData) {
                  controller.updateData(
                    title: titleController.text,
                    description: descController.text,
                    time: timeController.text,
                    id: widget.id!,
                  );
                } else {
                  controller.insertData(
                      title: titleController.text,
                      description: descController.text,
                      time: timeController.text);
                }
              },
              textColor: Colors.white,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              color: Colors.cyan,
              child:
                  Text(controller.updateTaskData ? "update Data" : "Add data"),
            ),
          ),
        ],
      ),
    );
  }
}
