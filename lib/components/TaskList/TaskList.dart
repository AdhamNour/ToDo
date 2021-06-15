import 'package:flutter/material.dart';
import 'package:todo/components/TaskList/TaskListItem/TaskListItem.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (ctx, index) => TaskListItem(taskName: "Task #$index", haveSubTasks: index%2==0,),
        itemCount: 15,shrinkWrap: true,
      ),
    );
  }
}
