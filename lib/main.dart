import 'package:flutter/material.dart';
import 'package:taskapp/newTask.dart';
import 'Home.dart';
import 'newTask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewTaskForm(),
      // home: const MyHomePage(title: 'To Do List'),
    );
  }
}
