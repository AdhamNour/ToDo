import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/Task.dart';
import 'package:todo/components/TaskList/TaskListItem/TaskListItemContent.dart';
import 'package:todo/providers/Tasks.dart';

class TaskListItem extends StatefulWidget {
  final Task targetTask;
  const TaskListItem({Key? key, required this.targetTask}) : super(key: key);

  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      builder: (context, candidateData, rejectedData) {
        return LongPressDraggable<int>(
          child: TaskListItemContent(targetTask: widget.targetTask),
          feedback: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(widget.targetTask.title),
            ),
            elevation: 12,
          ),
          childWhenDragging: Container(),
          data: widget.targetTask.id,
          onDragStarted: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Choose the parent")));
          },
        );
      },
      onWillAccept: (data) => data!=widget.targetTask.id,
      onAccept: (data) => Provider.of<Tasks>(context,listen: false).setParentOf(parentID: widget.targetTask.id!, childID: data),
    );
  }
}
