import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Database/TaskViews.dart';
import 'package:todo/components/TaskList/TaskListItem/TaskListItem.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context).tasks;
    print('Adham Nour $tasks');
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemBuilder: (ctx, index) => TaskListItem(taskName: "Task #$index", haveSubTasks: index%2==0,),
        itemCount: tasks.length,shrinkWrap: true,
      ),
    );
  }
}
