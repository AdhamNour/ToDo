import 'package:flutter/material.dart';
import 'package:todo/components/AddingTaskFloatingActionButton.dart';
import 'package:todo/components/AppDrawer/Drawer.dart';
import 'package:todo/components/TaskList/TaskList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int? filterOffset = ModalRoute.of(context)!.settings.arguments as int?;
    print('home screen: $filterOffset');
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
