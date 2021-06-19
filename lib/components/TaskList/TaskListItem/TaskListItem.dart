import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/TaskList/TaskList.dart';
import 'package:todo/providers/Models/Task.dart';

class TaskListItem extends StatefulWidget {
  final Task targetTask;
  const TaskListItem({Key? key,required this.targetTask}) : super(key: key);

  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  bool? checked;
  Function(bool?)? setChecked;
  @override
  void initState() {
    checked = widget.targetTask.done;
    setChecked = (newValue) {
      setState(() {
        widget.targetTask.done=newValue;
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
              //   trailing: widget.haveSubTasks
              //       ? IconButton(
              //           onPressed: setExpanded, icon: Icon(Icons.arrow_drop_down))
              //       : null,
              // ),
              // if (expanded) Container(child: TaskList(),height: screenSize.height*0.40,)
            )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      elevation: 3,
    );
  }
}
