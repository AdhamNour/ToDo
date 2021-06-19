import 'package:flutter/material.dart';
import 'package:todo/Models/Task.dart';
import 'package:todo/components/TaskList/TaskListItem/TaskListItemContent.dart';

class TaskListItem extends StatefulWidget {
  final Task targetTask;
  const TaskListItem({Key? key, required this.targetTask}) : super(key: key);

  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<int>(
      child: TaskListItemContent(targetTask: widget.targetTask),
      feedback: Card(
        child: Text(widget.targetTask.title),
        elevation: 10,
      ),
      childWhenDragging: Container(),
      data: widget.targetTask.id,
      onDragStarted: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Choose the parent")));
      },
    );
  }
}
