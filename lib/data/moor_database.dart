import 'package:moor_flutter/moor_flutter.dart';
import 'package:todo/Models/Task.dart';

part 'moor_database.g.dart';
@DataClassName('TaskModel')
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  DateTimeColumn get deadline => dateTime().nullable()();
  BoolColumn get done => boolean().withDefault(Constant(false))();
  BoolColumn get hasChildren => boolean().withDefault(Constant(false))();
  IntColumn get parent => integer().nullable()();
}

@UseMoor(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor(path: 'db.sql', logStatements: true));
    
  @override
  int get schemaVersion => 2;

  Future<List<TaskModel> > getAllTasks() => select(tasks).get();
  Stream<List<TaskModel>> watchTasks() => select(tasks).watch();
  Future<int> insertNewTask(TaskModel taskModel) => into(tasks).insert(taskModel);
  Future updateTask(TaskModel taskModel) => update(tasks).replace(taskModel);
  Future deleteTask(TaskModel taskModel) => delete(tasks).delete(taskModel);

}
