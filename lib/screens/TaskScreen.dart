import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/Task.dart';
import 'package:todo/components/AddingTaskFloatingActionButton.dart';
import 'package:todo/components/TaskList/TaskList.dart';
import 'package:todo/providers/Tasks.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);
  static const String routeName = "/TaskScreen";

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as Task;
    final TextEditingController _controller =
        new TextEditingController(text: task.title);
    print(task);
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                setState(() {
                  Provider.of<Tasks>(context, listen: false)
                      .changeTitleOfTask(taskName: value, id: task.id!);
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),hintText: "Your Task Title..."),
            ),
          ),
          Expanded(
              child: TaskList(
            parent: task.id,
          )),
        ],
      ),
      floatingActionButton: AddingTaskFloatingActionButton(
        parent: task.id,
      ),
    );
  }
}
