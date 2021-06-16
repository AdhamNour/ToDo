import 'package:sqflite/sqflite.dart';
import 'package:todo/Models/TaskModel.dart';

class TaskDB {
  static final TaskDB _taskDB = TaskDB._internal();
  Database? _db;
  factory TaskDB() {
    return _taskDB;
  }
  TaskDB._internal() {
    _init();
  }
  void _init() async {
    _db = await openDatabase('AN_ToDo.db');
    _db!.execute(
        'CREATE TABLE IF NOT EXISTS Task (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, parent INTEGER, child INTEGER)');
  }

  Future<int> insert(Task task) {
    return _db!.insert('Task', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  void delete(int id) {
    _db!.delete('Task', where: 'id = ?', whereArgs: [id]);
  }

  void update(Task newTask) {
    _db!.update('Task', newTask.toMap(),
        where: 'id = ?', whereArgs: [newTask.id]);
  }

  Future<List<Task>> get tasks async {
    List<Task> _tasks = [];
    while(_db==null) {
      await Future.delayed(Duration(milliseconds: 100));
    }
    await _db!.query('Task').then((value) {
      _tasks = value.map((e) => Task.fromMap(e)).toList();
    });
    return _tasks;
  }
}
