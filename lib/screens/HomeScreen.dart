import 'package:flutter/material.dart';
import 'package:todo/components/TaskList/TaskList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AN ToDo List"),
      ),
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Adding a Task to be implemented...");
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Task',
      ),
    );
  }
}
