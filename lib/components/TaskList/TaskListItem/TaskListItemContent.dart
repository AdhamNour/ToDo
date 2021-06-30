import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/Task.dart';
import 'package:todo/components/TaskList/TaskList.dart';
import 'package:todo/providers/Tasks.dart';
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
                onChanged: (newValue) {
                  setState(() {
                    expanded = false;
                  });
                  Provider.of<Tasks>(context, listen: false)
                      .setDoneForAllChildrenof(
                          parentID: widget.targetTask.id!, value: newValue);
                },
                key: ObjectKey(widget.targetTask),
              ),
              title: Text(widget.targetTask.title),
              trailing: Row(
                children: [
                  if (widget.targetTask.deadline != null)
                    Text(DateFormat('d/M/y')
                        .format(widget.targetTask.deadline!)),
                  if (widget.targetTask.haschildren)
                    IconButton(
                        onPressed: () {
                          setState(() {
                            expanded = !expanded;
                          });
                        },
                        icon: Icon(expanded
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down)),
                ],
                mainAxisSize: MainAxisSize.min,
              ),
              onTap: () => Navigator.of(context).pushNamed(TaskScreen.routeName,
                  arguments: widget.targetTask),
            ),
            if (expanded && widget.targetTask.haschildren)
              Container(
                child: TaskList(parent: widget.targetTask.id),
                height: screenSize.height * 0.20,
              )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      elevation: 3,
    );
  }
}
