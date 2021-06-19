import 'package:flutter/material.dart';
import 'package:todo/Models/Task.dart';
import 'package:todo/components/TaskList/TaskList.dart';
import 'package:todo/screens/TaskScreen.dart';

class TaskListItemContent extends StatefulWidget {
  final Task targetTask;
  const TaskListItemContent({Key? key, required this.targetTask})
      : super(key: key);

  @override
  _TaskListItemContentState createState() => _TaskListItemContentState();
}

class _TaskListItemContentState extends State<TaskListItemContent> {
  bool? checked;
  bool expanded = false;
  Function(bool?)? setChecked;
  @override
  void initState() {
    checked = widget.targetTask.done;
    setChecked = (newValue) {
      setState(() {
        widget.targetTask.done = newValue;
        checked = newValue;
      });
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Card(
      child: Container(
        child: Column(
          children: [
            ListTile(
              leading: Checkbox(
                value: checked,
                onChanged: setChecked,
              ),
              title: Text(widget.targetTask.title),
              trailing: widget.targetTask.haschildren
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          expanded = !expanded;
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down))
                  : null,
              onTap: () =>
                  Navigator.of(context).pushNamed(TaskScreen.routeName),
            ),
            if (expanded && widget.targetTask.haschildren)
              Container(
                child: TaskList(parent: widget.targetTask.id),
                height: screenSize.height * 0.40,
              )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      elevation: 3,
    );
  }
}
