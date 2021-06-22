import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/TaskList/TaskListItem/TaskListItem.dart';
import 'package:todo/providers/Tasks.dart';

class TaskList extends StatelessWidget {
  final int? parent;
  const TaskList({Key? key, this.parent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<Tasks>(context);
    final tasks =tasksProvider.tasks(parent: parent);
    final size = MediaQuery.of(context).size;
    //print('[Adham][$parent] $tasks');
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DragTarget<int>(
        builder: (context, candidateData, rejectedData) {
          return Container(
            child: tasks.isEmpty
                ? Center(
                    child: Column(
                    children: [
                      Icon(Icons.running_with_errors_sharp,
                          size: 130, color: Colors.blue[800]),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('No Tasks',
                            style: TextStyle(
                                fontSize: 130 / 4,
                                color: Colors.blueAccent[700])),
                      ),
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ))
                : ListView.builder(
                    itemBuilder: (ctx, index) {
                      return TaskListItem(
                        targetTask: tasks[index],
                        key: ObjectKey(tasks[index]),
                      );
                    },
                    itemCount: tasks.length,
                    shrinkWrap: true,
                  ),height: size.height,
          );
        },
        onAccept: (data) {
          tasksProvider.setParentOf(parentID: parent, childID: data);
        },
      ),
    );
  }
}
