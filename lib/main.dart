import 'package:flutter/material.dart';
import 'package:taskapp/Task.dart';
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
  String currentPage = 'home';
  late List<Task> taskList = [];

  @override
  Widget build(BuildContext context) {
    Function removeTask = (id) {
      taskList.removeWhere((element) => element.id == id);
      setState(() {
        
      });
    };
    Function addTask = (title, description, priority) {
      String id =
          'task' + taskList.length.toString() + DateTime.now().toString();
      Task task = new Task(
        title: title,
        description: description,
        priority: priority,
        id: id,
        removeTask:removeTask,
      );
      taskList.add(task);
      setState(() {});
    };
    Function navigate = (page) {
      currentPage = page;
      setState(() {});
    };
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: currentPage == 'home'
          ? MyHomePage(
              title: 'To Do List', navigate: navigate, taskList: taskList)
          : NewTaskForm(navigate: navigate, addTask: addTask),
      // home: const MyHomePage(title: 'To Do List'),
    );
  }
}
