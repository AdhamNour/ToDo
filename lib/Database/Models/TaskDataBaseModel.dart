import 'package:sqflite/sqflite.dart';
import 'package:todo/Database/Models/TaskModel.dart';

class TaskDB {
  static final TaskDB _taskDB = TaskDB._internal();
  late Database db;
  factory TaskDB() {
    return _taskDB;
  }
  TaskDB._internal() {
    openDatabase('AN_ToDo.db').then((value) {
      db = value;
      db.execute(
          'CREATE TABLE IF NOT EXISTS Task (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, parent INTEGER, child INTEGER)');
    });
  }

  Future<int> insert(Task task) {
    return db.insert('Task', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  void delete(int id) {
    db.delete('Task', where: 'id = ?', whereArgs: [id]);
  }

  void update(Task newTask) {
    db.update('Task', newTask.toMap(),
        where: 'id = ?', whereArgs: [newTask.id]);
  }

  Future<List<Task>> get tasks async {
    List<Task> _tasks = [];
    await db.query('Task').then((value) {
      _tasks = value.map((e) => Task.fromMap(e)).toList();
    });
    return _tasks;
  }
}
