import 'package:flutter/material.dart';
import 'package:todo/components/TaskList/TaskList.dart';

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
  bool expanded = false;
  Function(bool?)? setChecked;
  Function()? setExpanded;
  @override
  void initState() {
    checked = false;
    setChecked = (newValue) {
      setState(() {
        checked = newValue;
      });
    };
    setExpanded = () {
      print('kak');
      setState(() {
        expanded = !expanded;
      });
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Card(
      child: Container(
        height: expanded?screenSize.height*0.5:null,
        child: Column(
          children: [
            ListTile(
              leading: Checkbox(value: checked, onChanged: setChecked),
              title: Text(widget.taskName),
              trailing: widget.haveSubTasks
                  ? IconButton(
                      onPressed: setExpanded, icon: Icon(Icons.arrow_drop_down))
                  : null,
            ),
            if (expanded) Container(child: TaskList(),height: screenSize.height*0.40,)
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      elevation: 3,
    );
  }
}
