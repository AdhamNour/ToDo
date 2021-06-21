import 'package:flutter/material.dart';
import 'package:todo/Models/Task.dart';

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
      body: Center(child: Text(task.title)),
    );
  }
}
