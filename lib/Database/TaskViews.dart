import 'package:flutter/material.dart';
import 'package:todo/Database/TaskDataBaseModel.dart';
import 'package:todo/Models/TaskModel.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [];
  final db=TaskDB();
  Tasks(){fetchTasks();}

  List<Task> get tasks {
    return [..._tasks];
  }

  Future<void> fetchTasks() async {
    _tasks = [...await db.tasks];
    notifyListeners(); 
  }


  void insert({required String title}){
    db.insert(Task(title: title)).then((value) => fetchTasks());
  }

}
