import 'dart:convert';

class Task {
  String title;
  final int? id;
  int? parent;
  bool? done;
  bool haschildren = false;
  DateTime? deadline;
  Task(
      {required this.title,
      this.id,
      this.parent,
      this.done = false,
      this.deadline});

  Task copyWith({
    String? title,
    int? id,
    int? parent,
    bool? done,
  }) {
    return Task(
      title: title ?? this.title,
      id: id ?? this.id,
      parent: parent ?? this.parent,
      done: done ?? this.done,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'parent': parent,
      'done': done,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      id: map['id'],
      parent: map['parent'],
      done: map['done'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(title: $title, id: $id, parent: $parent, done: $done, haschildren:$haschildren)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.title == title &&
        other.id == id &&
        other.parent == parent &&
        other.done == done;
  }

  @override
  int get hashCode {
    return title.hashCode ^ id.hashCode ^ parent.hashCode ^ done.hashCode;
  }
}
