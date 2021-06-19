import 'package:flutter/cupertino.dart';
import 'package:todo/providers/Models/Task.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task>  tasks({int? parent}) {
    return [..._tasks.where((element) => element.parent==parent).toList()];
  }

  void addTask({required String taskName}) {
    _tasks.add(Task(title: taskName,id: _tasks.length));
    notifyListeners();
  }
}
