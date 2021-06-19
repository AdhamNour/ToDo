import 'package:flutter/cupertino.dart';
import 'package:todo/Models/Task.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> tasks({int? parent}) {
    return [..._tasks.where((element) => element.parent == parent).toList()];
  }

  void addTask({required String taskName}) {
    _tasks.add(Task(title: taskName, id: _tasks.length));
    notifyListeners();
  }

  void changeTitleOfTask({required String taskName, required int id}) {
    _tasks[id].title = taskName;
    notifyListeners();
  }

  void setParentOf({required int parentID, required int childID}) {
    _tasks[childID].parent = parentID;
    _tasks[parentID].children.add(childID);
    notifyListeners();
  }
  
}
