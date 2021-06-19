import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/TaskList/TaskListItem/TaskListItem.dart';
import 'package:todo/providers/Tasks.dart';

class TaskList extends StatelessWidget {
  final int? parent;
  const TaskList({Key? key,this.parent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context).tasks(parent: parent);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TaskListItem(targetTask: tasks[index],);
        },
        itemCount: tasks.length,
        shrinkWrap: true,
      ),
    );
  }
}
