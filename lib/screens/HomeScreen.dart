import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/TaskList/TaskList.dart';
import 'package:todo/providers/Tasks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("AN ToDo List"),
      ),
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
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
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Tasks with no title is not allowed")));
              return;
            }
            tasks.addTask(taskName: value['title'],deadline: value['deadline']);
          });
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Task',
      ),
    );
  }
}

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add new Task"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: widget._controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                hintText: "Type the name of your task title",
                labelText: "Task Title",
                prefixIcon: Icon(Icons.title)),
          ),
          Row(
            children: [
              Text(date == null
                  ? 'selected a deadline'
                  : DateFormat.yMd().format(date!)),
              IconButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100, 12, 31))
                        .then((value) => setState(() {
                              date = value;
                            }));
                  },
                  icon: Icon(Icons.calendar_today_sharp))
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel')),
        OutlinedButton(
            onPressed: () => Navigator.of(context)
                .pop({'title': widget._controller.text, 'deadline': date}),
            child: Text('Okay'))
      ],
    );
  }
}
