import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/Tasks.dart';

import 'AddTaskDialog.dart';

class AddingTaskFloatingActionButton extends StatelessWidget {
  const AddingTaskFloatingActionButton({Key? key, this.parent})
      : super(key: key);
  final int? parent;

  @override
  Widget build(BuildContext context) {
    final Tasks tasks = Provider.of<Tasks>(context, listen: false);

    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            final TextEditingController _controller =
                new TextEditingController();
            return AddTaskDialog(controller: _controller);
          },
        ).then((value) {
          if (value['title'] == null) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Task is canceled")));
            return;
          }
          if (value['title'].isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Tasks with no title is not allowed")));
            return;
          }
          tasks.addTask(taskName: value['title'], deadline: value['deadline'],parent:parent);
        });
      },
      child: Icon(Icons.add),
      tooltip: 'Add New Task',
    );
  }
}
