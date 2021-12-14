import 'package:flutter/material.dart';
import 'package:taskapp/Task.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController newTask = TextEditingController();
  late List<Task> taskList = [];
  // Task hardTask = const Task(title: 'Create a new Flutter App');
  @override
  Widget build(BuildContext context) {
    // taskList.add(hardTask);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          iconSize: 40,
          icon: Icon(Icons.home),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            iconSize: 40,
          )
        ],
      ),

      body: Center(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Task task = new Task(title: newTask.text);
                    newTask.clear();
                    taskList.add(task);
                    setState(() {});
                  },
                  icon: Icon(Icons.add))
            ],
            title: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white),
              child: TextField(
                controller: newTask,
                decoration: InputDecoration(
                    hintText: 'Add new Task', border: InputBorder.none),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          body: Column(
            children: taskList,
            
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
