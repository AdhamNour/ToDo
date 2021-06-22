import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/Task.dart';
import 'package:todo/components/AddingTaskFloatingActionButton.dart';
import 'package:todo/components/TaskList/TaskList.dart';
import 'package:todo/providers/Tasks.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);
  static const String routeName = "/TaskScreen";

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as Task;
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: TaskList(parent: task.id,),
      floatingActionButton: AddingTaskFloatingActionButton(parent: task.id,),
    );
  }
}
