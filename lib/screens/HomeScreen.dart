import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/AddingTaskFloatingActionButton.dart';
import 'package:todo/components/AppDrawer/Drawer.dart';
import 'package:todo/components/TaskList/TaskList.dart';
import 'package:todo/providers/Tasks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("AN ToDo List")
      ),
      drawer: AppDrawer(),
      body: TaskList(),
      floatingActionButton: AddingTaskFloatingActionButton(),
    );
  }
}
