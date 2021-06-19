import 'package:flutter/material.dart';
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
              return AlertDialog(
                title: Text("Add new Task"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          hintText: "Type the name of your task title",
                          labelText: "Task Title",
                          prefixIcon: Icon(Icons.title)),
                      onSubmitted: (newValue) =>
                          Navigator.of(context).pop(newValue),
                    )
                  ],
                ),
                actions: [
                  TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancel')),
                  OutlinedButton(onPressed: ()=> Navigator.of(context).pop(_controller.text), child: Text('Okay'))
                ],
              );
            },
          ).then((value) {
            if(value == null){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task is canceled")));
              return;
            }
            if(value.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Tasks with no title is not allowed")));
              return;
            }
            tasks.addTask(taskName: value);
          });
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Task',
      ),
    );
  }
}
