import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/config/task_bindings.dart';
import 'package:getx_sqflite/view/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TaskBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo app',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      initialBinding: TaskBindings(),
      home: HomeScreen(),
    );
  }
}
