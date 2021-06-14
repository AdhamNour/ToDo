import 'package:flutter/material.dart';

class TaskListItem extends StatefulWidget {
  final String taskName;
  final bool haveSubTasks;
  const TaskListItem(
      {Key? key, required this.taskName, required this.haveSubTasks})
      : super(key: key);

  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  bool? checked;
  Function(bool?)? setChecked;
  @override
  void initState() {
    checked = false;
    setChecked = (newValue) {
      setState(() {
        checked = newValue;
      });
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Checkbox(value: checked, onChanged: setChecked),
        title: Text(widget.taskName),
        trailing: widget.haveSubTasks
            ? IconButton(
                onPressed: () {
                  print("expand to be implemented...");
                },
                icon: Icon(Icons.arrow_drop_down))
            : null,
      ),
    );
  }
}
