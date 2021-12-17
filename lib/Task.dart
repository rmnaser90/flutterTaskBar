import 'dart:ffi';

import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task(
      {Key? key,
      required this.title,
      required this.description,
      required this.id,
      required this.removeTask,
      required this.priority})
      : super(key: key);
  final String title;
  final String description;
  final String id;
  final int priority;
  final Function removeTask;
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(widget.title),
          )),Text(widget.priority.toString()),
          Container(
            width: 100,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      widget.removeTask(widget.id);
                    },
                    icon: const Icon(Icons.delete)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
