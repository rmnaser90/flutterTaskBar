import 'package:flutter/material.dart';

class NewTaskForm extends StatefulWidget {
  const NewTaskForm({Key? key, required this.navigate, required this.addTask})
      : super(key: key);
  final Function navigate;
  final Function addTask;

  @override
  _NewTaskFormState createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  String prevText = '';
  bool isFormComplete = false;
  int selectPriority = 1;
  @override
  Widget build(BuildContext context) {
    Function checkForm = () {
      isFormComplete = (titleController.text.isNotEmpty &&
          descriptionController.text.isNotEmpty);
    };
    return Scaffold(
      appBar: AppBar(title: Text('New Task')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white),
              child: TextField(
                controller: titleController,
                onChanged: (v) {
                  checkForm();
                  setState(() {});
                },
                decoration: InputDecoration(
                    hintText: 'Task Title', border: InputBorder.none),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white),
              child: Column(children: [
                Container(
                  width: double.infinity,
                  height: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child: Container(height: 10)),
                      IconButton(
                          onPressed: () {
                            descriptionController.clear();
                            checkForm();
                            setState(() {});
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    checkForm();
                    if (value.length > 200) {
                      descriptionController.text = prevText;
                      descriptionController.selection =
                          TextSelection.fromPosition(TextPosition(
                              offset: descriptionController.text.length));
                    } else {
                      prevText = descriptionController.text;
                    }
                    setState(() {});
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: 'Description',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(10)),
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.top,
                ),
                Container(
                  width: double.infinity,
                  height: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child: Container(height: 10)),
                      Text((descriptionController.text.length).toString() +
                          '/200  ')
                    ],
                  ),
                )
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Priority: '),
                  Container(
                      child: Row(children: [
                    Text('1'),
                    Radio(
                        value: 1,
                        groupValue: selectPriority,
                        onChanged: (value) {
                          selectPriority = 1;
                          setState(() {});
                        }),
                  ])),
                  Container(
                      child: Row(children: [
                    Text('2'),
                    Radio(
                        value: 2,
                        groupValue: selectPriority,
                        onChanged: (value) {
                          selectPriority = 2;
                          setState(() {});
                        }),
                  ])),
                  Container(
                      child: Row(children: [
                    Text('3'),
                    Radio(
                        value: 3,
                        groupValue: selectPriority,
                        onChanged: (value) {
                          selectPriority = 3;
                          setState(() {});
                        }),
                  ])),
                  Container(
                      child: Row(children: [
                    Text('4'),
                    Radio(
                        value: 4,
                        groupValue: selectPriority,
                        onChanged: (value) {
                          selectPriority = 4;
                          setState(() {});
                        }),
                  ])),
                  Container(
                      child: Row(children: [
                    Text('5'),
                    Radio(
                      value: 5,
                      groupValue: selectPriority,
                      onChanged: (value) {
                        selectPriority = 5;
                        setState(() {});
                      },
                    ),
                  ]))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (isFormComplete) {
                            widget.addTask(
                                titleController.text,
                                descriptionController.text,
                                selectPriority);
                            widget.navigate('home');
                          }
                        },
                        child: Text('Save'),
                        style: ButtonStyle(
                          backgroundColor: isFormComplete
                              ? MaterialStateProperty.all(Colors.green)
                              : MaterialStateProperty.all(Colors.green[100]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.navigate('home');
                        },
                        child: Text('Cancel'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: prefer_function_declarations_over_variables
