import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  final String taskName;
  const TaskListItem({Key? key, required this.taskName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
          value: true,
          onChanged: (newValue) {
            print('To be implemented... $newValue');
          }),
      title: Text(taskName),
      trailing: IconButton(
          onPressed: () {
            print("expand to be implemented...");
          },
          icon: Icon(Icons.arrow_drop_down)),
    );
  }
}
