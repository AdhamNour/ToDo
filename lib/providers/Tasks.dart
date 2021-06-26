import 'package:flutter/cupertino.dart';
import 'package:todo/Models/Task.dart';
import 'package:todo/data/moor_database.dart';

class Tasks extends ChangeNotifier {
  //TODO: add the task manipulation to all functions
  List<Task> _tasks = [];
  final db = AppDatabase();
  Tasks() {
    db.watchTasks().listen((event) {
      _tasks = event.map((e) {
        print(e.toString());
        return Task(
            title: e.title,
            deadline: e.deadline,
            done: e.done,
            haschildren: e.hasChildren,
            parent: e.parent,
            id: e.id - 1);
      }).toList();
      notifyListeners();
    });
  }

  TaskModel _convertTask2TaskModel(Task task) {
    return TaskModel(
        id: task.id! + 1,
        title: task.title,
        done: task.done!,
        hasChildren: task.haschildren,
        parent: task.parent,
        deadline: task.deadline);
  }

  List<Task> tasks({int? parent}) {
    return [..._tasks.where((element) => element.parent == parent).toList()];
  }

  void addTask({required String taskName, DateTime? deadline, int? parent}) {
    print(deadline);
    _tasks.add(Task(
        title: taskName,
        id: _tasks.length,
        parent: parent,
        deadline: deadline));
    if (parent != null) {
      _tasks[parent].haschildren = true;
    }
    notifyListeners();
    db.insertNewTask(TaskModel(
        id: _tasks.length,
        title: taskName,
        done: false,
        hasChildren: false,
        parent: parent,
        deadline: deadline));
  }

  void changeTitleOfTask({required String taskName, required int id}) {
    _tasks[id].title = taskName;
    notifyListeners();
    db.updateTask(_convertTask2TaskModel(_tasks[id]));
  }

  void setParentOf({int? parentID, required int childID}) {
    int? prevParent = _tasks[childID].parent;
    _tasks[childID].parent = parentID;
    if (parentID != null) {
      _tasks[parentID].haschildren =
          _tasks.indexWhere((element) => element.parent == parentID) != -1;
    }
    if (prevParent != null) {
      _tasks[prevParent].haschildren =
          _tasks.indexWhere((element) => element.parent == prevParent) != -1;
    }
    notifyListeners();
    db.updateTask(_convertTask2TaskModel(_tasks[childID]));
    if (parentID != null) {
      db.updateTask(_convertTask2TaskModel(_tasks[parentID]));
    }
    if (prevParent != null) {
      db.updateTask(_convertTask2TaskModel(_tasks[prevParent]));
    }
  }

  void setDoneForAllChildrenof({required int parentID, required bool? value}) {
    List<Task> targetTasks =
        _tasks.where((element) => element.parent == parentID).toList();
    for (var i = 0; i < targetTasks.length; i++) {
      targetTasks = [
        ...targetTasks,
        ..._tasks
            .where((element) => element.parent == targetTasks[i].id)
            .toList()
      ];
      int x = targetTasks[i].id ?? -1;
      _tasks[x].done = value;
    }
    notifyListeners();
    targetTasks.forEach((element) {
      db.updateTask(_convertTask2TaskModel(element));
    });
  }

  void setDeadLineof({required int id, DateTime? newDeadline}) {
    _tasks[id].deadline = newDeadline;
    notifyListeners();
    db.updateTask(_convertTask2TaskModel(_tasks[id]));
  }

  void deleteTask(int id) {
    List<Task> targetTasks =
        _tasks.where((element) => element.parent == id).toList()..add(_tasks[id]);
    for (var i = 0; i < targetTasks.length; i++) {
      targetTasks = [
        ...targetTasks,
        ..._tasks
            .where((element) => element.parent == targetTasks[i].id)
            .toList()
      ];
    }
    targetTasks.forEach((element) {
      db.deleteTask(_convertTask2TaskModel(element));
    });
  }
}
