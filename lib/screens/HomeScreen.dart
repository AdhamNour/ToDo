import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Database/TaskViews.dart';
import 'package:todo/components/TaskList/TaskList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("AN ToDo List"),
      ),
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tasks.insert(
            title: 'random',
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Task',
      ),
    );
  }
}
