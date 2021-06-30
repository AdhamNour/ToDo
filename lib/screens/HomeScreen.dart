import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/components/AddingTaskFloatingActionButton.dart';
import 'package:todo/components/AppDrawer/Drawer.dart';
import 'package:todo/components/TaskList/TaskList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int? filterOffset =
        ModalRoute.of(context)!.settings.arguments as int?;
    String title = 'Inbox';
    if (filterOffset != null) {
      title = DateFormat('d/M/y')
          .format(DateTime.now().add(Duration(days: filterOffset)));
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: AppDrawer(),
      body: TaskList(
        filterOffset: filterOffset,
      ),
      floatingActionButton: AddingTaskFloatingActionButton(),
    );
  }
}
