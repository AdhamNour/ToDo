import 'dart:convert';

class Task {
    final String title;
    final int? id;
    final int? parent;
    final int? child;
  Task({
    required this.title,
    this.id,
    this.parent,
    this.child,
  });

  Task copyWith({
    String? title,
    int? id,
    int? parent,
    int? child,
  }) {
    return Task(
      title: title ?? this.title,
      id: id ?? this.id,
      parent: parent ?? this.parent,
      child: child ?? this.child,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'parent': parent,
      'child': child,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      id: map['id'],
      parent: map['parent'],
      child: map['child'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(title: $title, id: $id, parent: $parent, child: $child)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Task &&
      other.title == title &&
      other.id == id &&
      other.parent == parent &&
      other.child == child;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      id.hashCode ^
      parent.hashCode ^
      child.hashCode;
  }
}
