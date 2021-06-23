// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TaskModel extends DataClass implements Insertable<TaskModel> {
  final int id;
  final String title;
  final DateTime? deadline;
  final bool done;
  final bool hasChildren;
  final int? parent;
  TaskModel(
      {required this.id,
      required this.title,
      this.deadline,
      required this.done,
      required this.hasChildren,
      this.parent});
  factory TaskModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TaskModel(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      deadline: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deadline']),
      done: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}done'])!,
      hasChildren: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}has_children'])!,
      parent: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parent']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime?>(deadline);
    }
    map['done'] = Variable<bool>(done);
    map['has_children'] = Variable<bool>(hasChildren);
    if (!nullToAbsent || parent != null) {
      map['parent'] = Variable<int?>(parent);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      done: Value(done),
      hasChildren: Value(hasChildren),
      parent:
          parent == null && nullToAbsent ? const Value.absent() : Value(parent),
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TaskModel(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      done: serializer.fromJson<bool>(json['done']),
      hasChildren: serializer.fromJson<bool>(json['hasChildren']),
      parent: serializer.fromJson<int?>(json['parent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'done': serializer.toJson<bool>(done),
      'hasChildren': serializer.toJson<bool>(hasChildren),
      'parent': serializer.toJson<int?>(parent),
    };
  }

  TaskModel copyWith(
          {int? id,
          String? title,
          DateTime? deadline,
          bool? done,
          bool? hasChildren,
          int? parent}) =>
      TaskModel(
        id: id ?? this.id,
        title: title ?? this.title,
        deadline: deadline ?? this.deadline,
        done: done ?? this.done,
        hasChildren: hasChildren ?? this.hasChildren,
        parent: parent ?? this.parent,
      );
  @override
  String toString() {
    return (StringBuffer('TaskModel(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('deadline: $deadline, ')
          ..write('done: $done, ')
          ..write('hasChildren: $hasChildren, ')
          ..write('parent: $parent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              deadline.hashCode,
              $mrjc(done.hashCode,
                  $mrjc(hasChildren.hashCode, parent.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskModel &&
          other.id == this.id &&
          other.title == this.title &&
          other.deadline == this.deadline &&
          other.done == this.done &&
          other.hasChildren == this.hasChildren &&
          other.parent == this.parent);
}

class TasksCompanion extends UpdateCompanion<TaskModel> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime?> deadline;
  final Value<bool> done;
  final Value<bool> hasChildren;
  final Value<int?> parent;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.deadline = const Value.absent(),
    this.done = const Value.absent(),
    this.hasChildren = const Value.absent(),
    this.parent = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.deadline = const Value.absent(),
    this.done = const Value.absent(),
    this.hasChildren = const Value.absent(),
    this.parent = const Value.absent(),
  }) : title = Value(title);
  static Insertable<TaskModel> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime?>? deadline,
    Expression<bool>? done,
    Expression<bool>? hasChildren,
    Expression<int?>? parent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (deadline != null) 'deadline': deadline,
      if (done != null) 'done': done,
      if (hasChildren != null) 'has_children': hasChildren,
      if (parent != null) 'parent': parent,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<DateTime?>? deadline,
      Value<bool>? done,
      Value<bool>? hasChildren,
      Value<int?>? parent}) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      deadline: deadline ?? this.deadline,
      done: done ?? this.done,
      hasChildren: hasChildren ?? this.hasChildren,
      parent: parent ?? this.parent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime?>(deadline.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (hasChildren.present) {
      map['has_children'] = Variable<bool>(hasChildren.value);
    }
    if (parent.present) {
      map['parent'] = Variable<int?>(parent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('deadline: $deadline, ')
          ..write('done: $done, ')
          ..write('hasChildren: $hasChildren, ')
          ..write('parent: $parent')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, TaskModel> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 1, maxTextLength: 100);
  }

  final VerificationMeta _deadlineMeta = const VerificationMeta('deadline');
  @override
  late final GeneratedDateTimeColumn deadline = _constructDeadline();
  GeneratedDateTimeColumn _constructDeadline() {
    return GeneratedDateTimeColumn(
      'deadline',
      $tableName,
      true,
    );
  }

  final VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedBoolColumn done = _constructDone();
  GeneratedBoolColumn _constructDone() {
    return GeneratedBoolColumn('done', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _hasChildrenMeta =
      const VerificationMeta('hasChildren');
  @override
  late final GeneratedBoolColumn hasChildren = _constructHasChildren();
  GeneratedBoolColumn _constructHasChildren() {
    return GeneratedBoolColumn('has_children', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _parentMeta = const VerificationMeta('parent');
  @override
  late final GeneratedIntColumn parent = _constructParent();
  GeneratedIntColumn _constructParent() {
    return GeneratedIntColumn(
      'parent',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, deadline, done, hasChildren, parent];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<TaskModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    if (data.containsKey('has_children')) {
      context.handle(
          _hasChildrenMeta,
          hasChildren.isAcceptableOrUnknown(
              data['has_children']!, _hasChildrenMeta));
    }
    if (data.containsKey('parent')) {
      context.handle(_parentMeta,
          parent.isAcceptableOrUnknown(data['parent']!, _parentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TaskModel.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}
